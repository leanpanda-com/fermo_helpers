defmodule FermoHelpers.MixProject do
  use Mix.Project

  @version "0.6.0"
  @git_origin "https://github.com/leanpanda-com/fermo_helpers"

  def project do
    [
      app: :fermo_helpers,
      version: @version,
      elixir: "~> 1.9",
      description: "Helper functions for the Fermo static site generator",
      package: package(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: [
        main: "readme",
        extras: ["README.md"],
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
      {:morphix, "~> 0.0.7"}
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
