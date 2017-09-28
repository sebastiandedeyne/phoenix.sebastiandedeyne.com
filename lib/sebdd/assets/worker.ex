defmodule Sebdd.Assets.Worker do
  use Sebdd.Util.Worker

  def init(:ok) do
    {:ok, load_manifest()}
  end

  def handle_call({:asset, asset}, _from, assets) do
    {:reply, Map.get(assets, asset), assets}
  end

  defp load_manifest do
    "priv/static/asset-manifest.json"
    |> File.read!
    |> Poison.decode!
  end
end
