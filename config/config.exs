# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_test,
  ecto_repos: [PhoenixTest.Repo]

# Configures the endpoint
config :phoenix_test, PhoenixTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/X1k9a8sPa1r0zPaqjYE5dWVrMMOU46YTwaljeMAF1aFV4eyrrPi+ElB95Z0BtsW",
  render_errors: [view: PhoenixTestWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixTest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
