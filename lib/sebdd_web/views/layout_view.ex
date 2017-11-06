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
      UndefinedFunctionError -> default_title()
    end
  end

  def default_title do
    "Sebastian De Deyne"
  end

  def canonical_url(conn, assigns) do
    try do
      apply(view_module(conn), :canonical_url, [conn, assigns])
    rescue
      UndefinedFunctionError -> default_canonical_url(conn)
      FunctionClauseError -> default_canonical_url(conn)
    end
  end

  def default_canonical_url(conn) do
    SebddWeb.Router.Helpers.url(conn) <> conn.request_path
  end

  def nav(conn) do
    Enum.map(@nav, &nav_item(&1, conn.request_path))
    |> wrap("ul.flex")
    |> Phoenix.HTML.raw
  end

  defp nav_item({url, label}, req) do
    attrs = if active_url?(url, req), do: [class: "active"], else: []

    h("a", [href: url], label)
    |> wrap("li.nav-item", attrs)
  end

  defp active_url?("/", "/"), do: true
  defp active_url?("/", _req), do: false
  defp active_url?(url, req), do: String.starts_with?(req, url)
end
