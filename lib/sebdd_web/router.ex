defmodule SebddWeb.Router do
  use SebddWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(Sebdd.ResponseCache, profile: Sebdd.ResponseCache.Profiles.AllGetRequests)
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", SebddWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", HomeController, :index)

    get("/posts", PostsController, :index)
    get("/posts/page/:page", PostsController, :page)
    get("/posts/*slug", PostsController, :show)

    get("/open-source", OpenSourceController, :index)

    get("/about", AboutController, :index)

    get("/blogroll", BlogrollController, :index)
  end

  # Other scopes may use custom stacks.
  # scope "/api", SebddWeb do
  #   pipe_through :api
  # end
end
