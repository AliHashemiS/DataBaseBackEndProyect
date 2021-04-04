defmodule ProyectoBasesApi.Repo do
  use Ecto.Repo,
    otp_app: :proyecto_bases_api,
    adapter: Ecto.Adapters.Postgres
end
