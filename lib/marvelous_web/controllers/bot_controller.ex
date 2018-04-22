defmodule MarvelousWeb.BotController do
  use MarvelousWeb, :controller

  def execute(conn, params) do
    IO.puts("╔═════════════════════════════════════════════╗")
    IO.inspect(params)
    IO.puts("╚═════════════════════════════════════════════╝")
    %{version: version, result: result} = dispatch(params)

    case build_speech(result) do
      {:ok, template, data} -> render(conn, template, data: data, version: version)
      _ -> send_resp(conn, 400, "")
    end
  end

  defp dispatch(%{"result" => result, "lang" => lang}) do
    set_locale(lang)
    %{version: :v1, result: result}
  end

  defp dispatch(%{"queryResult" => result}) do
    set_locale(result["languageCode"])
    %{version: :v2, result: result}
  end

  defp set_locale(lang) when lang == nil do
    Gettext.put_locale("en")
  end

  defp set_locale(lang) do
    [locale | _] = String.split(lang, "-")
    Gettext.put_locale(locale)
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
    {:ok, "text.json", gettext("I'm not sure about that")}
  end
end
