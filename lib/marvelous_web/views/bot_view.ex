defmodule MarvelousWeb.BotView do
    use MarvelousWeb, :view
  
    def render("default.json",  %{text: text}) do
      %{speech: text, displayText: text}
    end
end
  