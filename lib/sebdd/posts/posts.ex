defmodule Sebdd.Posts do
  alias Sebdd.Posts.Worker

  def all do
    GenServer.call(Worker, {:all})
  end

  def paginator(page, per_page \\ 20)
  def paginator(page, per_page) when is_binary(page) do
    paginator(String.to_integer(page), per_page)
  end
  def paginator(page, per_page) do
    GenServer.call(Worker, {:page, page, per_page})
  end

  def find(path) do
    GenServer.call(Worker, {:path, path})
  end
end
