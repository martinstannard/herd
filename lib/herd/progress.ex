defmodule Herd.Progress do
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args)
  end

  def map(progress) do
    GenServer.call(progress, :map)
  end

  def lesson(progress) do
    GenServer.call(progress, :lesson)
  end

  def activity(progress) do
    GenServer.call(progress, :activity)
  end
  def progress(progress) do
    GenServer.call(progress, :progress)
  end

  def init(_) do
    {:ok, %{map: 1, lesson: 1, activity: 1}}
  end

  def handle_call(:map, _from, state) do
    {:reply, Map.get(state, :map), state}
  end

  def handle_call(:activity, _from, state) do
    {:reply, Map.get(state, :activity), state}
  end

  def handle_call(:lesson, _from, state) do
    {:reply, Map.get(state, :lesson), state}
  end

  def handle_call(:progress, _from, state) do
    map = Map.get(state, :map)
    lesson = Map.get(state, :lesson)
    activity = Map.get(state, :activity)
    {:reply, %{map: map, lesson: lesson, activity: activity}, state}
  end

end

