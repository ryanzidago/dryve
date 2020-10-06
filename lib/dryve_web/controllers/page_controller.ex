defmodule DryveWeb.PageController do
  use DryveWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
