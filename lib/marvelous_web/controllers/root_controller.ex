defmodule MarvelousWeb.RootController do
  use MarvelousWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json")
  end
end
