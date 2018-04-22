defmodule MarvelousWeb.BotView do
  use MarvelousWeb, :view

  def render("text.json", %{data: text}) do
    %{fulfillmentText: text}
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
      fulfillmentText: text,
      fulfillmentMessages: [
        %{
          simpleResponses: %{
            simpleResponses: [
              %{
                displayText: text,
                textToSpeech: text
              }
            ]
          }
        },
        %{
          basicCard: %{
            subtitle: name,
            title: "#{volume_name} ##{issue_number}",
            image: %{
              url: imageUrl,
              accessibility_text: text
            }
          }
        }
      ]
    }
  end
end
