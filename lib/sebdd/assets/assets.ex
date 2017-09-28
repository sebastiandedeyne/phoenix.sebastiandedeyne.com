defmodule Sebdd.Assets do
  alias Sebdd.Assets.Worker

  def asset_path(asset) do
    GenServer.call(Worker, {:asset, asset})
  end
end
