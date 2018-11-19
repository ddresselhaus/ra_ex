defmodule RaKv do
  @behaviour :ra_machine

  def init(args) do
    %{}
  end

  def apply(_meta, {:write, key, value}, effects, state) do
    {Map.put(state, key, value), effects, :ok}
  end

  def apply(_meta, {:read, key}, effects, state) do
    reply = Map.get(state, key)
    {state, effects, reply}
  end
end
