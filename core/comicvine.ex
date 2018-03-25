defmodule ComicVine do
    use Tesla
    plug Tesla.Middleware.BaseUrl, "https://comicvine.gamespot.com/api"
    plug Tesla.Middleware.JSON
    plug Tesla.Middleware.Query, [api_key: "74407b8568118ef59e717fdb9f3d146da20d94b3", format: "json"]

    def volume( [filter: filter, sort: sort ]) do
        get("/volumes?api_key=74407b8568118ef59e717fdb9f3d146da20d94b3&format=json")
    end
  end