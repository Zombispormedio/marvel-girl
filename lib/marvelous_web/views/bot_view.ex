defmodule MarvelousWeb.BotView do
  use MarvelousWeb, :view

  defp formatIssue(%{
         "image" => %{"small_url" => image_url},
         "name" => name,
         "issue_number" => issue_number,
         "volume" => %{"name" => volume_name}
       }) do
    text =
      gettext(
        "The last issue is %{volume_name} #%{issue_number}: %{name}",
        volume_name: volume_name,
        issue_number: issue_number,
        name: name
      )

    {name, issue_number, image_url, volume_name, text}
  end

  def render("text.json", %{data: text, version: :v1}) do
    %{speech: text, displayText: text}
  end

  def render("text.json", %{data: text, version: :v2}) do
    %{fulfillmentText: text}
  end

  def render("last_issue.json", %{data: issue, version: :v1}) do
    {name, issue_number, image_url, volume_name, text} = formatIssue(issue)

    %{
      speech: text,
      displayText: text,
      messages: [
        %{
          displayText: text,
          platform: "google",
          textToSpeech: text,
          type: "simple_response"
        },
        %{
          image: %{
            url: image_url,
            accessibility_text: text
          },
          subtitle: name,
          title: "#{volume_name} ##{issue_number}",
          platform: "google",
          type: "basic_card"
        }
      ]
    }
  end

  def render("last_issue.json", %{data: issue, version: :v2}) do
    {name, issue_number, image_url, volume_name, text} = formatIssue(issue)

    %{
      fulfillmentText: text,
      fulfillmentMessages: [
        %{
          text: %{
            text: [
              text
            ]
          }
        }
      ],
      payload: %{
        google: %{
          expectUserResponse: false,
          richResponse: %{
            items: [
              %{
                simpleResponse: %{
                  displayText: text,
                  textToSpeech: text
                }
              },
              %{
                basicCard: %{
                  subtitle: name,
                  title: "#{volume_name} ##{issue_number}",
                  image: %{
                    imageUri: image_url,
                    accessibilityText: text
                  }
                }
              }
            ]
          }
        }
      }
    }
  end
end
