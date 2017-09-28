defmodule Sebdd.Posts do
  alias Sebdd.Posts.Worker

  def all do
    GenServer.call(Worker, {:all})
  end

  def paginator(page) when is_binary(page) do
    paginator(String.to_integer(page))
  end

  def paginator(page) do
    GenServer.call(Worker, {:page, page})
  end

  def find(path) do
    GenServer.call(Worker, {:path, path})
  end
end
