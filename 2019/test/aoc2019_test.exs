defmodule Aoc2019Test do
  use ExUnit.Case
  doctest Aoc2019

  test "aoc1" do
    assert Aoc1_1.solve("lib/1/input.txt") == 3511949
    assert Aoc1_2.solve("lib/1/input.txt") == 5265045
  end

  test "aoc2" do
    assert Aoc2_1.solve("lib/2/input.txt") == 3516593
    assert Aoc2_2.solve("lib/2/input.txt", 19_690_720) == 7749
  end

  test "aoc3" do
    assert Aoc3_1.solve("lib/3/input.txt") == 1064
    assert Aoc3_2.solve("lib/3/input.txt") == 25676
  end

  test "aoc4" do
    assert Aoc4_1.solve(367_479, 893_698) == 495
    assert Aoc4_2.solve(367_479, 893_698) == 305
  end
end
