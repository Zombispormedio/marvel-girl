defmodule MarvelousWeb.BotController do
    use MarvelousWeb, :controller
  
    def execute(conn, %{"result" => %{"parameters" => %{"geo-city" => city}}}) do
        response = "The Weather in #{city} is good"
        render(conn, "response.json", response: response)
    end
  end
  