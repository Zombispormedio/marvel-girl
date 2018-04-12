defmodule Marvelous.Mixfile do
  use Mix.Project

  def project do
    [
      app: :marvelous,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Marvelous.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "core", "test/support"]
  defp elixirc_paths(_), do: ["lib", "core"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.2"},
      {:phoenix_pubsub, "~> 1.0"},
      {:gettext, "~> 0.15.0"},
      {:cowboy, "~> 1.0"},
      {:tesla, "~> 0.10.0"},
      {:hackney, "~> 1.6"},
      {:poison, ">= 1.0.0"},
      {:envy, "~> 1.1.1"}
    ]
  end
end
