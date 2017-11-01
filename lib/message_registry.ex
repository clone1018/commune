defmodule Commune.MessageRegistry do
  @moduledoc """
  Registers/Handles Messages
  """

  def init(options) do
    
    options
  end

  def call(conn, _opts) do
    case :ets.match_object(:commune_messages, {conn.request_path, :_, :_}) do
      [{_path, plug, opts}] -> plug.call(conn, plug.init(opts))
      [] -> conn
    end
  end

  @doc """
  Register a route with the SimplateRouter
  """
  def register(path, plug, opts) do
    true = :ets.insert(:commune_messages, {path, plug, opts})
  end

  @doc """
  Unregister a route with the SimplateRouter
  """
  def unregister(path, plug) do
     true = :ets.match_delete(:commune_messages, {path, plug, :_})
  end

end
