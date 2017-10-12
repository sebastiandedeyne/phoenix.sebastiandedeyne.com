defmodule Sebdd.Posts.Worker do
  @path "posts/"

  alias Sebdd.Posts.Post

  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def terminate(reason, _state) do
    throw reason
  end

  def init(:ok) do
    {:ok, load_posts()}
  end

  def handle_call({:all}, _from, posts) do
    {:reply, posts, posts}
  end

  def handle_call({:page, page}, _from, posts) do
    paginated = Enum.chunk_every(posts, 5)
    
    paginated_posts = Enum.at(paginated, page - 1, [])
    has_prev = page != 1
    has_next = page < Enum.count(paginated)

    {:reply, [posts: paginated_posts, has_prev: has_prev, has_next: has_next, page: page], posts}
  end

  def handle_call({:path, path}, _from, posts) do
    post = Enum.find(posts, fn p -> p.path == path end)

    {:reply, post, posts}
  end

  defp load_posts do
    @path <> "*.md"
    |> Path.wildcard
    |> Enum.map(&load_post/1)
    |> Enum.sort(fn a, b -> Date.compare(a.date, b.date) == :gt end)
  end

  defp load_post(path) do
    {matter, body} = YamlFrontMatter.parse_file!(path)

    Post.from_document(String.replace_prefix(path, @path, ""), matter, body)
  end
end
