defmodule CommuneTest do
  use ExUnit.Case
  doctest Commune

  test "greets the world" do
    assert Commune.hello() == :world
  end
end
