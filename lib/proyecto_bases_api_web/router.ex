defmodule ProyectoBasesApiWeb.Router do
  use ProyectoBasesApiWeb, :router

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end

  scope "/api", ProyectoBasesApiWeb do
    pipe_through :api
  end

  scope "/api", ProyectoBasesApiWeb do
    pipe_through :api
    resources "/test", TestController, only: [:index]
  end

  scope "/api", ProyectoBasesApiWeb do
    pipe_through :api
    resources "/table/attributes", TableAttributesController, only: [:index]
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/", ProyectoBasesApiWeb do
      pipe_through :browser
      get "/", DefaultController, :index
    end
  end
end
