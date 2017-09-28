defmodule SebddWeb.PageController do
  use SebddWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
