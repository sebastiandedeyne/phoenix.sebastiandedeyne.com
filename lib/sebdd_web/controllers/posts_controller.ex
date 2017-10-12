defmodule SebddWeb.PostsController do
  use SebddWeb, :controller

  alias Sebdd.Posts

  def index(conn, _params) do
    paginator = Posts.paginator(1)

    render(conn, "index.html", paginator)
  end

  def page(conn, %{"page" => page}) do
    paginator = Posts.paginator(page)

    render(conn, "index.html", paginator)
  end

  def show(conn, %{"slug" => slug}) do
    post = Posts.find(slug)

    render(conn, "show.html", post: post)
  end
end
