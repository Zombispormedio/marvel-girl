defmodule ComicVineClient do
  defmacro __using__(_opts) do
    quote do
      use Tesla
      plug(Tesla.Middleware.BaseUrl, "https://comicvine.gamespot.com/api")
      plug(Tesla.Middleware.JSON)

      defp default_query() do
        %{api_key: System.get_env("COMIC_VINE_API_KEY"), format: "json"}
      end

      defp get_api_key() do
        case System.get_env("COMIC_VINE_API_KEY") do
          nil -> "${COMIC_VINE_API_KEY}"
          x -> x
        end
      end

      def retrieve(path, query: query) do
        get("#{path}/?#{URI.encode_query(default_query())}&#{URI.encode_query(query)}")
      end
    end
  end
end
