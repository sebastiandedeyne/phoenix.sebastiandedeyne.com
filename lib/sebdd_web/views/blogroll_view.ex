defmodule SebddWeb.BlogrollView do
  use SebddWeb, :view

  def title(_action, _assigns), do: "Blogroll"

  def group_by_category(blogroll) do
    Enum.group_by(blogroll, fn %{category: category} -> category end)
  end 
end
