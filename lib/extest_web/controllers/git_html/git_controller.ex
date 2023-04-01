defmodule ExtestWeb.GitController do
  use ExtestWeb, :controller

  def hello(conn, _params) do
    render(conn, :git)
  end
end
