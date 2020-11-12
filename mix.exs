defmodule FermoHelpers.MixProject do
  use Mix.Project

  @version "0.12.0"
  @git_origin "https://github.com/leanpanda-com/fermo_helpers"

  def project do
    [
      app: :fermo_helpers,
      version: @version,
      elixir: "~> 1.9",
      name: "Fermo Helpers",
      description: "Helper functions for the Fermo static site generator",
      package: package(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: [
        extras: ["README.md"],
        homepage_url: @git_origin,
        main: "readme",
        source_ref: "v#{@version}",
        source_url: @git_origin
      ],
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:calendar, "~> 1.0.0"},
      {:deep_merge, "~> 1.0"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:jason, "~> 1.1"},
      {:morphix, ">= 0.8.0"},
      {:yaml_elixir, "~> 1.3.0"}
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      links: %{
        "GitHub" => @git_origin
      },
      maintainers: ["Joe Yates"]
    }
  end
end
