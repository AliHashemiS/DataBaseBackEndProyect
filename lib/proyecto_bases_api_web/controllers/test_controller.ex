defmodule ProyectoBasesApiWeb.TestController do
  use ProyectoBasesApiWeb, :controller

  def index(conn, _params) do
    {:ok, pid} = Postgrex.start_link(hostname: "localhost", username: "root", password: "root", database: "battery_steward_api_development")

    json(conn, %{
      name: "Kendall",
      last_name: "W22222222alsh"
      })
  end
end
