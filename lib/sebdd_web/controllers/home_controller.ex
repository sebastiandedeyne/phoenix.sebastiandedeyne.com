defmodule SebddWeb.HomeController do
  use SebddWeb, :controller

  alias Sebdd.Posts

  def index(conn, _params) do
    render(conn, "index.html", posts: Posts.all())
  end
end
