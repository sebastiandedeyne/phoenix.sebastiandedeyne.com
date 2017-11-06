defmodule SebddWeb.PostsView do
  use SebddWeb, :view

  def title(_action, %{post: post}), do: post.title
  def title(_action, _assigns), do: "Posts"

  def canonical_url(conn, %{post: post}) do
    if post.original_publication_url do
      post.original_publication_url
    else
      SebddWeb.LayoutView.default_canonical_url(conn)
    end
  end
end
