defmodule Herd.StudentTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, student} = Herd.Student.start_link(%{name: "martin"})
    {:ok, student: student}
  end

  test "has a name", %{student: student} do
    assert Herd.Student.name(student) == "martin"
  end

  test "has eggs", %{student: student} do
    assert Herd.Student.eggs(student) == 0
  end

  test "can award eggs", %{student: student} do
    Herd.Student.award_eggs(student, 10)
    assert Herd.Student.eggs(student) == 10
  end
end

