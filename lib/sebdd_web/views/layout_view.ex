defmodule SebddWeb.LayoutView do
  use SebddWeb, :view

  @nav [
    {"/", "Home"},
    {"/posts", "Posts"},
    {"/open-source", "Open Source"},
    {"/about", "About"}
  ]

  def title(conn, assigns) do
    try do
      apply(view_module(conn), :title, [action_name(conn), assigns]) <> " — Sebastian De Deyne"
    rescue
      UndefinedFunctionError -> "Sebastian De Deyne"
    end
  end

  def nav(conn) do
    Enum.map(@nav, &nav_item(&1, conn.request_path))
    |> wrap("ul.header__nav")
    |> Phoenix.HTML.raw
  end

  defp nav_item({url, label}, req) do
    attrs = if active_url?(url, req), do: [class: "-active"], else: []

    h("a", [href: url], label)
    |> wrap("li.header__nav__item", attrs)
  end

  defp active_url?("/", "/"), do: true
  defp active_url?("/", _req), do: false
  defp active_url?(url, req), do: String.starts_with?(req, url)
end
