defmodule GravityAssistTest do
  use ExUnit.Case
  doctest GravityAssist

  test "1,9,10,3,2,3,11,0,99,30,40,50" do
    assert GravityAssist.run([1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50]) == [
             3500,
             9,
             10,
             70,
             2,
             3,
             11,
             0,
             99,
             30,
             40,
             50
           ]
  end

  test "1,0,0,0,99" do
    assert GravityAssist.run([1, 0, 0, 0, 99]) == [
             2,
             0,
             0,
             0,
             99
           ]
  end

  test "2,3,0,3,99" do
    assert GravityAssist.run([2, 3, 0, 3, 99]) == [
             2,
             3,
             0,
             6,
             99
           ]
  end

  test "2,4,4,5,99,0" do
    assert GravityAssist.run([2, 4, 4, 5, 99, 0]) == [
             2,
             4,
             4,
             5,
             99,
             9801
           ]
  end

  test "1,1,1,4,99,5,6,0,99" do
    assert GravityAssist.run([1, 1, 1, 4, 99, 5, 6, 0, 99]) == [
             30,
             1,
             1,
             4,
             2,
             5,
             6,
             0,
             99
           ]
  end
end
