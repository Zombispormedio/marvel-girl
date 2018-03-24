defmodule MarvelousWeb.BotController do
    use MarvelousWeb, :controller
  
    def execute(conn, %{ "result" => result }) do
        IO.inspect result
        response = makeResponse(result)
        render(conn, "response.json", response: response)
    end

    defp makeResponse(%{ "action" => "get_last_issue", "parameters" => parameters }) do
        IO.inspect parameters
        "I'm getting the last issue"
    end

    defp makeResponse(_result) do
        "I'm not sure about that"
    end
  end
  