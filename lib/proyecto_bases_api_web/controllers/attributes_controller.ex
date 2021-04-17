defmodule ProyectoBasesApiWeb.AttributesController do
  use ProyectoBasesApiWeb, :controller

  def index(conn, %{
    #Parametros que se reciben del front end para realizar la conexión a la base de datos
    "server" => server,
    "port" => port,
    "username" => username,
    "password" => password,
    "database" => database,
    "tableName" => table,
    "attributeName" => attribute}) do

      
    #Se crea una conexión a posgres utilizando el hostname, puerto, usuario, contrasena y nombre de la base de datos
    {:ok, pid} = Postgrex.start_link(hostname: server, port: port, username: username, password: password, database: database)

    #Se crea un query al schema para obtener los privilegios de una tabla de un usuario
    result3 = Postgrex.query!(pid, "SELECT privilege_type
    FROM information_schema.role_column_grants
    WHERE table_name='#{table}' and
    column_name = '#{attribute}'", [])
    %Postgrex.Result{}

    #Se retorna los privilegios del atributo como json
    json(conn, result3.rows)
  end
end

# http://localhost:4000/api/table/attributes/privilege
