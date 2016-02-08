defmodule Herd.Student do
  @moduledoc """
  A basic student entity
  """
  use GenServer

  ## client interface

  def start_link(args) do
    GenServer.start_link(__MODULE__, args)
  end

  def name(pid) do
    GenServer.call(pid, :name)
  end

  def eggs(pid) do
    GenServer.call(pid, :eggs)
  end

  def award_eggs(pid, count) do
    GenServer.cast(pid, {:award_eggs, count})
  end

  ## server implementation
  #
  def init(args) do
    map = Map.merge(%{eggs: 0}, args)
    {:ok, map}
  end

  def handle_call(:name, _from, state) do
    {:reply, Map.get(state, :name), state}
  end

  def handle_call(:eggs, _from, state) do
    {:reply, Map.get(state, :eggs), state}
  end

  def handle_cast({:award_eggs, count}, state) do
    {:noreply, Map.update!(state, :eggs, &(&1 + count))}
  end

end
