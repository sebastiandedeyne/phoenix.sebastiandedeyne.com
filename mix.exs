defmodule Sebdd.Mixfile do
  use Mix.Project

  def project do
    [
      app: :sebdd,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [ignore_warnings: "dialyzer.ignore-warnings"]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Sebdd.Application, []},
      extra_applications: [:logger, :runtime_tools, :yaml_front_matter, :timex]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:phoenix_extra_generators, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:hyper_ex, "~> 0.1"},
      {:cowboy, "~> 1.0"},
      {:poison, "~> 3.1"},
      {:earmark, "~> 1.2"},
      {:timex, "~> 3.0"},
      {:yaml_front_matter, "~> 0.3"},
      {:plug_response_cache, "~> 0.0.3"},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false}
    ]
  end
end
