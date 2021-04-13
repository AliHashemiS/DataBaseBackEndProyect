defmodule ProyectoBasesApiWeb.TableAttributesController do
  use ProyectoBasesApiWeb, :controller

  def index(conn, %{
    "server" => server,
    "port" => port,
    "username" => username,
    "password" => password,
    "database" => database,
    "tableName" => table}) do

    IO.inspect(table)
    {:ok, pid} = Postgrex.start_link(hostname: server, port: port, username: username, password: password, database: database)

    result2 = Postgrex.query!(pid, "SELECT column_name,data_type from information_schema.columns where table_name='#{table}'", [])
    %Postgrex.Result{}

    json(conn, result2.rows)
  end
end

# http://localhost:4000/api/table/attributes
