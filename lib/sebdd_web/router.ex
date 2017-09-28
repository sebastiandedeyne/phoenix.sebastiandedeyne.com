defmodule SebddWeb.Router do
  use SebddWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SebddWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    
    get "/posts", PostsController, :index
    get "/posts/page/:page", PostsController, :page
    get "/posts/*slug", PostsController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", SebddWeb do
  #   pipe_through :api
  # end
end
