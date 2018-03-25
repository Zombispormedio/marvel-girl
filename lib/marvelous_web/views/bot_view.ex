defmodule MarvelousWeb.BotView do
  use MarvelousWeb, :view

  def render("text.json", %{data: text}) do
    %{speech: text, displayText: text}
  end

  def render("last_issue.json", %{data: issue}) do
    %{
      imageUrl: issue["image"]["small_url"],
      subtitle: issue["name"],
      title: "#{issue["volume"]["name"]} ##{issue["issue_number"]}",
      type: 1
    }
  end
end
