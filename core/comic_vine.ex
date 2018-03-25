# t=Path.split("https://comicvine.gamespot.com/api/issue/4000-662080/") |> Enum.take(-2) |> Enum.join("/")
# String.pad_leading(t, String.length(t)+1, "/")
defmodule ComicVine do
  use ComicVineClient

  def get_last_issue(name: name) do
    [volume | _tail] =
      retrieve(
        '/volumes',
        query: %{
          filter: "name:#{name}",
          sort: "date_last_updated:desc",
          field_list: "name,last_issue",
          limit: 1
        }
      ).body["results"]

    Map.merge(volume["last_issue"], %{"volume_name" => volume["name"]})
  end
end
