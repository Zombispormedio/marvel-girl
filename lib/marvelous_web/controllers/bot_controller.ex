defmodule MarvelousWeb.BotController do
  use MarvelousWeb, :controller

  def execute(conn, params) do
    IO.inspect(params)
    %{"result" => result} = params

    case build_speech(result) do
      {:ok, template, data} -> render(conn, template, data: data)
      _ -> send_resp(conn, 400, "")
    end
  end

  defp build_speech(%{"action" => "issue.last", "parameters" => %{"volume" => volume}}) do
    issue = ComicVine.get_last_issue(volume: volume)

    case issue do
      nil -> {:ko}
      _ -> {:ok, "last_issue.json", issue}
    end
  end

  defp build_speech(%{"action" => "input.welcome"}) do
  end

  defp build_speech(_result) do
    {:ok, "text.json", "I'm not sure about that"}
  end
end
