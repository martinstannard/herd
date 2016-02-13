defmodule Herd.ProgressTest do
  use ExUnit.Case, async: true

  test "can be started" do
    {:ok, progress} = Herd.Progress.start_link("martin")
    assert progress
  end

  test "has a map" do
    {:ok, progress} = Herd.Progress.start_link("martin")
    assert Herd.Progress.map(progress) == 1
  end

  test "has a lesson" do
    {:ok, progress} = Herd.Progress.start_link("martin")
    assert Herd.Progress.lesson(progress) == 1
  end

  test "has an activity" do
    {:ok, progress} = Herd.Progress.start_link("martin")
    assert Herd.Progress.activity(progress) == 1
  end

  test "can return a tuple" do
    {:ok, progress} = Herd.Progress.start_link("martin")
    assert Herd.Progress.progress(progress) == %{map: 1, lesson: 1, activity: 1}
  end

end

