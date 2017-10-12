defmodule SebddWeb.PartialsView do
  use SebddWeb, :view

  def analytics_id() do
    Application.get_env(:sebdd, SebddWeb.Endpoint)[:analytics_id]
  end
end
