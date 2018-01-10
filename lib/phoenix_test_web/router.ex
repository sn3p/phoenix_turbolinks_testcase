defmodule PhoenixTestWeb.Router do
  use PhoenixTestWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(Turbolinks)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", PhoenixTestWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)

    get("/things", ThingsController, :show)
    post("/things", ThingsController, :create)
    delete("/things", ThingsController, :delete)
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixTestWeb do
  #   pipe_through :api
  # end
end
