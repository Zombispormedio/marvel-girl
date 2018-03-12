defmodule MarvelousWeb.BotController do
    use MarvelousWeb, :controller
  
    def execute(conn, _params) do
        response = "This is a sample response from your webhook!"
        render(conn, "response.json", response: response)
    end
  end
  