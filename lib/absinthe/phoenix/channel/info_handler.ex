defmodule Absinthe.Phoenix.Channel.InfoHandler do
  @moduledoc """
  This module is used to handle the info messages from the Absinthe.Phoenix.Channel module.
  """

  def handle_info(:gc, socket), do: Absinthe.Phoenix.Channel.handle_garbage_collect(socket)
  def handle_info(_, socket) do
    {:noreply, socket}
  end
end
