defmodule Sebdd.ResponseCache do
  import Plug.Conn
  alias Sebdd.ResponseCache.Worker

  def init(options), do: options

  def call(conn, _opts) do
    case GenServer.call(Worker, {:get, conn.request_path}) do
      nil -> register_before_send(conn, fn conn ->
        GenServer.cast(Worker, {:set, conn.request_path, {conn.status, conn.resp_body}})
        conn
      end)
      {status, body} -> send_resp(conn, status, body) |> halt()
    end
  end
end
