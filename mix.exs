defmodule FermoHelpers.MixProject do
  use Mix.Project

  def project do
    [
      app: :fermo_helpers,
      version: "0.3.0",
      elixir: "~> 1.9",
      description: "Helper functions for the Fermo static site generator",
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: [
        main: "FermoHelpers",
        extras: ["README.md"]
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
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/leanpanda-com/fermo_helpers"
      },
      maintainers: ["Joe Yates"]
    }
  end
end
