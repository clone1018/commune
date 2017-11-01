defmodule Commune do
  @moduledoc """
  Documentation for Commune.
  """
  use Application 

  @doc """
  Hello world.

  ## Examples

      iex> Commune.hello
      :world

  """

  def start(_type, _args) do
    :ets.new(:commune_messages, [:named_table, :public])
    
    Commune.Supervisor.start_link(name: Commune.Supervisor)
  end
end
