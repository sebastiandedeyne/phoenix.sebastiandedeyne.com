defmodule Sebdd.ResponseCache.Profile do
  @callback cache?(Plug.Conn.t()) :: boolean()
end
