defmodule ProyectoBasesApiWeb.TestController do
  use ProyectoBasesApiWeb, :controller

  def index(conn, %{"server" => server, "port" => port, "username" => username, "password" => password, "database" => database}) do

    {:ok, pid} = Postgrex.start_link(hostname: server, port: port, username: username, password: password, database: database)

    result = Postgrex.query!(pid, "SELECT  table_schema,table_name from information_schema.tables where table_schema not in ('pg_catalog','information_schema') and table_type='BASE TABLE'", [])
    %Postgrex.Result{}

    json(conn, result.rows)
  end
end
