defmodule Herd.StudentRegistryTest do
  use ExUnit.Case, async: true

  #setup do
    #{:ok, registry} = Herd.StudentRegistry.start_link
    #{:ok, registry: registry}
  #end

  test "creates students" do
    assert Herd.StudentRegistry.lookup("martin") == :error

    Herd.StudentRegistry.create("martin")
    assert {:ok, student} = Herd.StudentRegistry.lookup("martin")

    assert Herd.Student.eggs(student) == 0
    assert Herd.Student.name(student) == "martin"
  end

  test "errors on duplicate student name" do
    Herd.StudentRegistry.create("martin1")
    assert Herd.StudentRegistry.create("martin1") == :error
  end
end
