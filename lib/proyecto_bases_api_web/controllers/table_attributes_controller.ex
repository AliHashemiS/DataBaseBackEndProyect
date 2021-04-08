defmodule ProyectoBasesApiWeb.TableAttributesController do
  use ProyectoBasesApiWeb, :controller

  def index(conn, %{"table" => table} = params) do
    IO.inspect(table)
    json(conn, table)
  end
end

# http://localhost:4000/api/table/attributes