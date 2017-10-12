defmodule SebddWeb.OpenSourceController do
  use SebddWeb, :controller

  @projects [
    %{
      name: "hyper_ex",
      url: "https://github.com/spatie/hyper_ex",
      description: "HyperScript clone written in Elixir",
      type: "elixir"
    },
    %{
      name: "laravel-html",
      url: "https://github.com/spatie/laravel-html",
      description: "Fluent alternative to the Laravel Collective package",
      type: "laravel"
    },
    %{
      name: "laravel-menu",
      url: "https://github.com/spatie/laravel-menu",
      description: "Fluent html menu generator for Laravel applications",
      type: "laravel"
    },
    %{
      name: "laravel/framework",
      url: "https://github.com/laravel/framework/pulls?utf8=%E2%9C%93&q=is%3Apr%20is%3Amerged%20author%3Asebastiandedeyne%20",
      description: "Various contributions to the Laravel framework",
      type: "laravel"
    },
    %{
      name: "lightbulb",
      url: "https://github.com/sebastiandedeyne/lightbulb",
      description: "Project natural shadows under elements",
      type: "typescript"
    },
    %{
      name: "menu",
      url: "https://github.com/spatie/menu",
      description: "Fluent html menu generator for PHP applications",
      type: "php"
    },
    %{
      name: "opening-hours",
      url: "https://github.com/spatie/opening-hours",
      description: "Define and query a set of business hours",
      type: "php"
    },
    %{
      name: "phpunit-snapshot-assertions",
      url: "https://github.com/spatie/phpunit-snapshot-assertions",
      description: "Test without writing actual test cases",
      type: "php"
    },
    %{
      name: "regex",
      url: "https://github.com/spatie/regex",
      description: "A sane interface for php's built in preg functions",
      type: "php"
    },
    %{
      name: "schema-org",
      url: "https://github.com/spatie/schema-org",
      description: "Fluent Schema.org json+ld builder that gets generated from the spec",
      type: "php"
    },
    %{
      name: "spatie-dom",
      url: "https://github.com/spatie/spatie-dom",
      description: "A small DOM querying and manipulation library",
      type: "javascript"
    },
    %{
      name: "yaml_front_matter",
      url: "https://github.com/sebastiandedeyne/yaml_front_matter",
      description: "A parser for documents with yaml front matter in Elixir",
      type: "elixir"
    }
  ]

  def index(conn, _params) do
    render(conn, "index.html", projects: @projects)
  end
end
