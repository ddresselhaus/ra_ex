defmodule RaExTest do
  use ExUnit.ClusteredCase, async: false

  scenario "given a healthy cluster", cluster_size: 3 do
    # Node setups work similar to `setup` in ExUnit, but are run on each node of the cluster
    # node_setup([:start_apps, :seed_kvstore])
    node_setup(:config_node)

    # Just plain old tests - note the :cluster key of the context, which is needed to talk
    # to the nodes of the cluster via the Cluster API (an alias added for you)
    test "writes are replicated to all nodes", %{cluster: cluster} do
      [_a, _b, _c] = Cluster.members(cluster)
    end
  end

  def config_node(_) do
    Application.put_env(:ex_unit_clustered_case, :name, Node.self())
  end
end
