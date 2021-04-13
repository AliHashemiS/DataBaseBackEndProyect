defmodule ProyectoBasesApiWeb.AttributesController do
  use ProyectoBasesApiWeb, :controller

  def index(conn, %{
    "server" => server,
    "port" => port,
    "username" => username,
    "password" => password,
    "database" => database,
    "tableName" => table,
    "attributeName" => attribute}) do

    IO.inspect(table)
    {:ok, pid} = Postgrex.start_link(hostname: server, port: port, username: username, password: password, database: database)

    result3 = Postgrex.query!(pid, "SELECT privilege_type
    FROM information_schema.role_column_grants
    WHERE table_name='#{table}' and
    column_name = '#{attribute}'", [])
    %Postgrex.Result{}

    json(conn, result3.rows)
  end
end

# http://localhost:4000/api/table/attributes/privilege
