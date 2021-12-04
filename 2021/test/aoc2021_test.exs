defmodule Aoc2021Test do
  use ExUnit.Case
  doctest Aoc2021

  test "aoc1" do
    assert Aoc1_1.solve("lib/1/input.txt") == 1233
    assert Aoc1_2.solve("lib/1/input.txt") == 1275
  end

  test "aoc2" do
    assert Aoc2_1.solve("lib/2/input.txt") == 1936494
    assert Aoc2_2.solve("lib/2/input.txt") == 1997106066
  end

  test "aoc3" do
    assert Aoc3_1.solve("lib/3/input.txt") == 2640986
    assert Aoc3_2.solve("lib/3/input.txt") == 6822109
  end
end
