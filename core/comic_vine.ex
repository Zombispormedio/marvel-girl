defmodule ComicVine do
  use ComicVineClient

  def get_last_issue(volume: volume) do
    retrieve(
      '/issues',
      query: %{
        filter: "volume:#{volume}",
        sort: "cover_date:desc",
        field_list: "volume,issue_number,name,image",
        limit: 1
      }
    ).body["results"]
    |> List.first()
  end
end
