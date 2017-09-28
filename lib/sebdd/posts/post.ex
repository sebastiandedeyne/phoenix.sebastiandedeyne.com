defmodule Sebdd.Posts.Post do
  defstruct [
    :date,
    :slug,
    :path,
    :url,
    :title,
    :subtitle,
    :original_publication_name,
    :original_publication_url,
    :read_more_text,
    :read_more_url,
    :contents,
    :summary
  ]

  def from_document(filename, matter, body) do
    [date, slug, _] = String.split(filename, ".", parts: 3);

    date = Date.from_iso8601!(date)

    %__MODULE__{
      date: date,
      slug: slug,
      path: [Integer.to_string(date.year), slug],
      title: matter["title"],
      subtitle: matter["subtitle"],
      original_publication_name: matter["original_publication_name"],
      original_publication_url: matter["original_publication_url"],
      read_more_text: matter["read_more_text"],
      read_more_url: matter["read_more_url"],
      contents: body,
      summary: matter["summary"] || body
    }
  end
end
