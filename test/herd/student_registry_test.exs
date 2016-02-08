defmodule Herd.StudentRegistryTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, registry} = Herd.StudentRegistry.start_link
    {:ok, registry: registry}
  end

  test "creates students", %{registry: registry} do
    assert Herd.StudentRegistry.lookup(registry, "martin") == :error

    Herd.StudentRegistry.create(registry, "martin")
    assert {:ok, student} = Herd.StudentRegistry.lookup(registry, "martin")

    assert Herd.Student.eggs(student) == 0
    assert Herd.Student.name(student) == "martin"
  end

  test "errors on duplicate student name", %{registry: registry} do
    Herd.StudentRegistry.create(registry, "martin")
    assert Herd.StudentRegistry.create(registry, "martin") == :error
  end
end
