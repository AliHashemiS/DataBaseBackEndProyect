# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :proyecto_bases_api,
  ecto_repos: [ProyectoBasesApi.Repo]

# Configures the endpoint
config :proyecto_bases_api, ProyectoBasesApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xgWIRTgfB/0uVdZwjztbh6o/W0mLZe2HhYJlfokxPV0I4k25xdJ0a48NI9nUsLAh",
  render_errors: [view: ProyectoBasesApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ProyectoBasesApi.PubSub,
  live_view: [signing_salt: "jvXYpsiA"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
