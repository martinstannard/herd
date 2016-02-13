defmodule Herd.ProgressTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, progress} = Herd.Progress.start()
    {:ok, progress: progress}
  end

  test "has a map", %{progress: progress} do
    assert Herd.progress.map(progress) == 1
  end

end

