defmodule Absinthe.Phoenix.ChannelNoHandle do
  use Phoenix.Channel
  require Logger

  @moduledoc """
  This is the standard Absinthe.Phoenix.Channel module, but without the handle_info functions.
  """

  @doc false
  def __using__(_) do
    raise """
    ----------------------------------------------
    You should `use Absinthe.Phoenix.Socket`
    ----------------------------------------------
    """
  end

  @doc false
  defdelegate join(topic, params, socket), to: Absinthe.Phoenix.Channel
  @doc false
  defdelegate handle_in(message,payload, socket), to: Absinthe.Phoenix.Channel
  @doc false
  defdelegate default_pipeline(schema, options), to: Absinthe.Phoenix.Channel



  @doc """
  This allows you to handle the garbage collection in your own handle_info function.
  """
  def handle_garbage_collect(socket) do
    :erlang.garbage_collect()
    :erlang.garbage_collect(socket.transport_pid)
    Process.send_after(self(), :gc, socket.assigns.absinthe.gc_interval)
    {:noreply, socket}
  end

end
