defmodule ProyectoBasesApiWeb.TableAttributesController do
  use ProyectoBasesApiWeb, :controller

  def index(conn, %{
    #Parametros que se reciben del front end para realizar la conexión a la base de datos
    "server" => server,
    "port" => port,
    "username" => username,
    "password" => password,
    "database" => database,
    "tableName" => table}) do

    #Se crea una conexión a posgres utilizando el hostname, puerto, usuario, contrasena y nombre de la base de datos
    {:ok, pid} = Postgrex.start_link(hostname: server, port: port, username: username, password: password, database: database)

    #Se crea un query al schema para obtener los atributos de una tabla
    result2 = Postgrex.query!(pid, "SELECT column_name,data_type from information_schema.columns where table_name='#{table}'", [])
    %Postgrex.Result{}

    #Se retorna los atributos de la tabla en formato JSON
    json(conn, result2.rows)
  end
end

# http://localhost:4000/api/table/attributes
