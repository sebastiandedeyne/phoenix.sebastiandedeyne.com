defmodule Sebdd.ResponseCache do
  import Plug.Conn
  alias Sebdd.ResponseCache.Worker

  def init(options), do: options

  def call(conn, [profile: profile]) do
    case apply(profile, :cache?, [conn]) do
      true -> send_cached(conn)
      false -> conn
    end
  end

  defp send_cached(conn) do
    case GenServer.call(Worker, {:get, conn.request_path}) do
      nil -> register_before_send(conn, fn conn ->
        GenServer.cast(Worker, {:set, conn.request_path, {conn.status, conn.resp_body}})
        conn
      end)
      {status, body} -> send_resp(conn, status, body) |> halt()
    end
  end
end
