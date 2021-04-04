defmodule ProyectoBasesApiWeb.DefaultController do
  use ProyectoBasesApiWeb, :controller

  def index(conn, _params) do
    json(conn, %{id: "messenger"})
  end
end