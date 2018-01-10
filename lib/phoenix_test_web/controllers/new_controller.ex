defmodule PhoenixTestWeb.NewController do
  use PhoenixTestWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, _params) do
    render(conn, "show.html")
  end

  def create(conn, _params) do
    conn
    |> put_flash(:info, "Post was successfull.")
    |> redirect(to: page_path(conn, :show))
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:error, "Delete was successfull.")
    |> redirect(to: page_path(conn, :show))
  end
end
