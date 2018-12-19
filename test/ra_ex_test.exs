defmodule RaExTest do
  use ExUnit.ClusteredCase, async: false

  scenario "given a healthy cluster", cluster_size: 4, boot_timeout: 10_000 do
    # Node setups work similar to `setup` in ExUnit, but are run on each node of the cluster
    # node_setup([:start_apps, :seed_kvstore])
    node_setup(:config_node)

    # Just plain old tests - note the :cluster key of the context, which is needed to talk
    # to the nodes of the cluster via the Cluster API (an alias added for you)
    test "writes are replicated to all nodes", %{cluster: cluster} do
      [a, b, c, d] = Cluster.members(cluster)
      members = [{:kv_a, a}, {:kv_b, b}, {:kv_c, c}]
      cluster_name = "ra_kv"
      machine = {:module, RaKv, %{}}
      e = Cluster.call(a, RaEx, :start_cluster, [cluster_name, machine, members])
      f = Cluster.call(b, RaEx, :process_command, [{:kv_a, a}, {:write, "dan", "dresselhaus"}])
      g = Cluster.partition(cluster, 4)
      h = Cluster.call(a, RaEx, :process_command, [{:kv_c, c}, {:write, "dan", "dresselhizi"}])
      i = Cluster.call(b, RaEx, :process_command, [{:kv_b, b}, {:read, "dan"}])

      require IEx
      IEx.pry()

      RaEx.process_command({:kv_a, a}, {:write, "dan", "dresselhaus"})
      {:ok, result, _leader} = RaEx.process_command({:kv_b, b}, {:read, "dan"})
      assert result == "dresselhaus"
    end
  end

  def config_node(_) do
    Application.ensure_all_started(:ra)
    Application.put_env(:ex_unit_clustered_case, :name, Node.self())
  end
end
