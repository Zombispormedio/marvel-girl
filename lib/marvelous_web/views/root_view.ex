defmodule MarvelousWeb.RootView do
  use MarvelousWeb, :view

  def render("index.json", _assigns) do
    %{say: "Hello! I'm Marvelous Mary. Nice to meet you"}
  end
end
