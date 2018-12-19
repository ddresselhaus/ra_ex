defmodule RaEx do
  def start() do
    :ra.start()
  end

  def start(params) when is_list(params) do
    :ra.start(params)
  end

  def start_in(data_dir) do
    :ra.start_in(data_dir)
  end

  def start_server(configuration) do
    :ra.start_server(configuration)
  end

  def start_server(cluster_name, server_id, machine, members) do
    :ra.start_server(cluster_name, server_id, machine, members)
  end

  def restart_server(server_id) do
    :ra.restart_server(server_id)
  end

  def stop_server(server_id) do
    :ra.stop_server(server_id)
  end

  def delete_server(server_id) do
    :ra.delete_server(server_id)
  end

  def start_cluster(cluster_name, machine, members) do
    :ra.start_cluster(cluster_name, machine, members)
  end

  def delete_cluster(server_ids) do
    :ra.delete_server(server_ids)
  end

  def delete_cluster(server_ids, timeout) do
    :ra.delete_cluster(server_ids, timeout)
  end

  def start_or_restart_cluster(cluster_name, machine, members) do
    :ra.start_or_restart_cluster(cluster_name, machine, members)
  end

  def process_command(server_id, command) do
    :ra.process_command(server_id, command)
  end

  def process_command(server_id, command, timeout) do
    :ra.process_command(server_id, command, timeout)
  end

  def remove_member(server_ref, server_id) do
    :ra.remove_member(server_ref, server_id)
  end

  def remove_member(server_ref, server_id, timeout) do
    :ra.remove_member(server_ref, server_id, timeout)
  end

  def trigger_election(ra_server_id) do
    :ra.trigger_election(ra_server_id)
  end

  def trigger_election(ra_server_id, timeout) do
    :ra.trigger_election(ra_server_id, timeout)
  end

  def leave_and_terminate(server_id) do
    :ra.leave_and_terminate(server_id)
  end

  def leave_and_terminate(server_ref, server_id) do
    :ra.leave_and_terminate(server_ref, server_id)
  end

  def leave_and_terminate(server_ref, server_id, timeout) do
    :ra.leave_and_terminate(server_ref, server_id, timeout)
  end

  def leave_and_delete_server(server_id) do
    :ra.leave_and_delete_server(server_id)
  end

  def leave_and_delete_server(server_ref, server_id) do
    :ra.leave_and_delete_server(server_ref, server_id)
  end

  def overview() do
    :ra.overview()
  end

  def pipeline_command(server_id, command, :no_correlation, priority) do
    :ra.pipeline_command(server_id, command, :no_correlation, priority)
  end

  def pipeline_command(server_id, command, correlation, priority) do
    :ra.pipeline_command(server_id, command, correlation, priority)
  end

  def pipeline_command(server_id, command, correlation) do
    :ra.pipeline_command(server_id, command, correlation)
  end

  def pipeline_command(server_id, command) do
    :ra.pipeline_command(server_id, command)
  end

  def local_query(server_id, query_fun) do
    :ra.local_query(server_id, query_fun)
  end

  def local_query(server_id, query_fun, timeout) do
    :ra.local_query(server_id, query_fun, timeout)
  end

  def consistent_query(server_id, query_fun, timeout) do
    :ra.consistent_query(server_id, query_fun, timeout)
  end

  def consistent_query(server_id, query_fun) do
    :ra.consistent_query(server_id, query_fun)
  end

  def members(server_id) do
    :ra.members(server_id)
  end

  def members(server_id, timeout) do
    :ra.members(server_id, timeout)
  end
end
