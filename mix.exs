defmodule Postgrex.Mixfile do
  use Mix.Project

  @version "0.14.0-dev"

  def project do
    [
      app: :postgrex,
      version: @version,
      elixir: "~> 1.4",
      deps: deps(),
      name: "Postgrex",
      description: "PostgreSQL driver for Elixir",
      source_url: "https://github.com/elixir-ecto/postgrex",
      docs: docs(),
      package: package()
    ]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: [:logger, :db_connection, :decimal, :crypto],
      mod: {Postgrex.App, []},
      env: [type_server_reap_after: 3 * 60_000, json_library: Jason]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :docs},
      {:jason, "~> 1.0", only: :test},
      {:decimal, "~> 1.0"},
      {:db_connection, "~> 2.0.0-dev", github: "elixir-ecto/db_connection", ref: "fbe3775"},
      {:connection, "~> 1.0"},
      {:pbkdf2_elixir, "~> 0.12", optional: true}
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      main: "readme",
      extras: ["README.md"],
      groups_for_modules: [
        # Postgrex
        # Postgrex.Notifications
        # Postgrex.Query
        # Postgrex.Result
        "Data Types": [
          Postgrex.Box,
          Postgrex.Circle,
          Postgrex.INET,
          Postgrex.Interval,
          Postgrex.Lexeme,
          Postgrex.Line,
          Postgrex.LineSegment,
          Postgrex.MACADDR,
          Postgrex.Path,
          Postgrex.Point,
          Postgrex.Polygon,
          Postgrex.Range
        ],
        "Custom types and Extensions": [
          Postgrex.Extension,
          Postgrex.TypeInfo,
          Postgrex.Types
        ]
      ]
    ]
  end

  defp package do
    [
      maintainers: ["Eric Meadows-Jönsson", "James Fish"],
      licenses: ["Apache 2.0"],
      links: %{"Github" => "https://github.com/elixir-ecto/postgrex"}
    ]
  end
end
