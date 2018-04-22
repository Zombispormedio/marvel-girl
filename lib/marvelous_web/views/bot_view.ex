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
                    image_uri: imageUrl,
                    accessibility_text: text
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
