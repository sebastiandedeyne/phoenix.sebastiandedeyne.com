defmodule Sebdd.ResponseCache.Profiles.AllGetRequests do
  @behaviour Sebdd.ResponseCache.Profile

  alias Plug.Conn

  def cache?(%Conn{method: "GET"}), do: true
  def cache?(_conn), do: false
end
