defmodule MarvelousWeb.BotController do
  use MarvelousWeb, :controller

  def execute(conn, %{"result" => result}) do
    IO.inspect(result)

    case build_speech(result) do
      {:ok, text} -> render(conn, "default.json", text: text)
      _ -> send_resp(conn, 400, "")
    end
  end

  defp build_speech(%{"action" => "input.welcome"}) do
  end

  defp build_speech(%{"action" => "issue.last", "parameters" => %{"volume" => volume}}) do
    issue = ComicVine.get_last_issue(name: volume)

    text =
      gettext(
        "The last issue is %{volume_name} #%{issue_number}: %{name}",
        volume_name: issue["volume_name"],
        issue_number: issue["issue_number"],
        name: issue["name"]
      )

    {:ok, text}
  end

  defp build_speech(_result) do
    {:ok, "I'm not sure about that"}
  end
end
