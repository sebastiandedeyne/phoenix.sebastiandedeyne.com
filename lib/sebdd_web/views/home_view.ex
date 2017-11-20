defmodule SebddWeb.HomeView do
  use SebddWeb, :view

  def group_posts_by_year(posts) do
    Enum.group_by(posts, & &1.date.year)
    |> Enum.sort(fn {a, _}, {b, _} -> a > b end)
  end
end
