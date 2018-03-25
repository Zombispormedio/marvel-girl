defmodule MarvelousWeb.BotView do
  use MarvelousWeb, :view

  def render("text.json", %{data: text}) do
    %{speech: text, displayText: text}
  end

  def render("last_issue.json", %{data: issue}) do
    %{
      "image" => %{"small_url" => imageUrl},
      "name" => name,
      "issue_number" => issue_number,
      "volume" => %{"name" => volume_name}
    } = issue

    text =
      gettext(
        "The last issue is %{volume_name} #%{issue_number}: %{name}",
        volume_name: volume_name,
        issue_number: issue_number,
        name: name
      )

    %{
      speech: text,
      displayText: text,
      messages: %{
        imageUrl: imageUrl,
        subtitle: name,
        title: "#{volume_name} ##{issue_number}",
        type: 1
      }
    }
  end
end
