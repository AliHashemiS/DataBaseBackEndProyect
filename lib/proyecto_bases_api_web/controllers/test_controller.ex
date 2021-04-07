defmodule ProyectoBasesApiWeb.TestController do
  use ProyectoBasesApiWeb, :controller

  def index(conn, %{"server" => server, "port" => port, "username" => username, "password" => password, "database" => database} = params) do
    IO.inspect (params[:server])
    {:ok, pid} = Postgrex.start_link(hostname: server, username: username, password: password, database: database)

    result = Postgrex.query!(pid, "SELECT  table_schema,table_name from information_schema.tables where table_schema not in ('pg_catalog','information_schema') and table_type='BASE TABLE'", [])
    %Postgrex.Result{}
    result2 = Postgrex.query!(pid, "SELECT column_name,data_type from information_schema.columns where table_name='user_account'", [])
    %Postgrex.Result{}

    json(conn, result.rows)
  end
end
