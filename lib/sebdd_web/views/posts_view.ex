defmodule SebddWeb.PostsView do
  use SebddWeb, :view

  def title(_action, %{post: post}), do: post.title
  def title(_action, assigns), do: "Posts"
end
