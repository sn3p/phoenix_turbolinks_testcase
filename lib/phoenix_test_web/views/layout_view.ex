defmodule PhoenixTestWeb.LayoutView do
  use PhoenixTestWeb, :view

  import Phoenix.Controller, only: [get_flash: 2, get_csrf_token: 0]
end
