defmodule MarvelousWeb.BotView do
    use MarvelousWeb, :view
  
    def render("response.json",  %{response: response}) do
      %{speech: response, displayText: response}
    end
end
  