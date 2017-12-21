defmodule SebddWeb.ViewHelpers do
  def asset_path(asset) do
    "priv/static/asset-manifest.json"
    |> File.read!()
    |> Poison.decode!()
    |> Map.get(asset)
  end

  def partial(template, assigns \\ []) do
    Phoenix.View.render(SebddWeb.PartialsView, template, assigns)
  end

  def svg(path) do
    "assets/svg/#{path}.svg"
    |> File.read!()
    |> Phoenix.HTML.raw()
  end

  def markdown(markdown) do
    markdown
    |> Earmark.as_html()
    |> Phoenix.HTML.raw()
  end
end
