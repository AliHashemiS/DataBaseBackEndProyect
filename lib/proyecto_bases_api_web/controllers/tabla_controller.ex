defmodule ProyectoBasesApiWeb.TablaController do
  use ProyectoBasesApiWeb, :controller

  def index(conn, 
  #Parametros que se reciben del front end para realizar la conexión a la base de datos
  %{"server" => server,
    "port" => port,
    "username" => username,
    "password" => password,
    "database" => database}) do

    #Se crea una conexión a posgres utilizando el hostname, puerto, usuario, contrasena y nombre de la base de datos
    {:ok, pid} = Postgrex.start_link(hostname: server, port: port, username: username, password: password, database: database)

    #Se crea un query para obtener las tablas del schema de la bases de datos
    result = Postgrex.query!(pid, "SELECT  table_schema,table_name from information_schema.tables where table_schema not in ('pg_catalog','information_schema') and table_type='BASE TABLE'", [])
    %Postgrex.Result{}

    #Se retorna las tablas en formato JSON
    json(conn, result.rows)
  end
end
