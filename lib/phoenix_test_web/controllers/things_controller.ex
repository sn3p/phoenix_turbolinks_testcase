defmodule PhoenixTestWeb.ThingsController do
  use PhoenixTestWeb, :controller

  def show(conn, _params) do
    render(conn, "show.html")
  end

  def create(conn, _params) do
    conn
    |> put_flash(:info, "Post was successful.")
    |> redirect(to: page_path(conn, :index))
    # |> render("show.html")
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:error, "Delete was successful.")
    |> redirect(to: page_path(conn, :index))
    # |> render("show.html")
  end
end
