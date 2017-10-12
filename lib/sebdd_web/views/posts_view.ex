defmodule SebddWeb.PostsView do
  use SebddWeb, :view

  def title(:show, [post: post]) do
    post.title
  end

  def title(_action, _assigns) do
    "Posts"
  end
end
