defmodule Sebdd.Env do
  def get(key, default \\ nil) do
    env = Application.get_env(:sebdd, SebddWeb.Endpoint)

    Keyword.get(env, key, default)
  end
end
