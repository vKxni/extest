defmodule ExtestWeb.Buttony do
  use ExtestWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, button_text: "bye")}
  end

  def handle_event("toggle_text", _, socket) do
    new_text =
      case socket.assigns.button_text do
        "bye" -> "hi there"
        _ -> "bye"
      end
    {:noreply, assign(socket, button_text: new_text)}
  end
end
