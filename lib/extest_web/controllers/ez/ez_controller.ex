defmodule ExtestWeb.EzController do
  use ExtestWeb, :controller

  def ping(conn, _params) do
    json(conn, "lol there!")
  end
end
