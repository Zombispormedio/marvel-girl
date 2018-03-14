defmodule MarvelousWeb.BotController do
    use MarvelousWeb, :controller
  
    def execute(conn, params) do
        IO.inspect params
        response = "This is a sample response from your webhook!"
        render(conn, "response.json", response: response)
    end
  end
  