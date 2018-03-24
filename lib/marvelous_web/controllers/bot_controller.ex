defmodule MarvelousWeb.BotController do
    use MarvelousWeb, :controller
  
    def execute(conn, %{ "result" => result }) do
        IO.puts result
        response = "I am in it"
        render(conn, "response.json", response: response)
    end
  end
  