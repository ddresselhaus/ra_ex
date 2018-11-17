defmodule RaExTest do
  use ExUnit.Case
  doctest RaEx

  test "greets the world" do
    assert RaEx.hello() == :world
  end
end
