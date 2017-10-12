defmodule SebddWeb.AboutController do
  use SebddWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
