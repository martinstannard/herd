defmodule Herd.StudentRegistry do
  @moduledoc """
  A registry for students

  Registers each student by name
  """
  use GenServer

  alias Herd.Student

  ## Client API

  @doc """
  Starts the registry.
  """
  def start_link() do
    GenServer.start_link(__MODULE__, :ok, [])
  end

  @doc """
  Looks up the student pid for `name` stored in `server`.

  Returns `{:ok, pid}` if the student exists, `:error` otherwise.
  """
  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end

  @doc """
  Ensures there is a student associated to the given `name` in `server`.
  """
  def create(server, name) do
    GenServer.call(server, {:create, name})
  end

  ## Server Callbacks

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:lookup, name}, _from, students) do
    {:reply, Map.fetch(students, name), students}
  end

  def handle_call({:create, name}, _from,  students) do
    if Map.has_key?(students, name) do
      {:reply, :error, students}
    else
      {:ok, student} = Student.start_link(%{name: name})
      students = Map.put(students, name, student)
      {:reply, {:ok, student}, students}
    end
  end
end
