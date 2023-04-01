defmodule ExtestWeb.LolController do
  use ExtestWeb, :controller

  def hello(conn, _params) do
    render(conn, :lol)
  end
end
