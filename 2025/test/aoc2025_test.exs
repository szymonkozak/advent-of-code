defmodule Aoc2025Test do
  use ExUnit.Case
  doctest Aoc2025

  test "aoc1" do
    assert Aoc1_1.solve("lib/1/input.txt") == 1168
    assert Aoc1_2.solve("lib/1/input.txt") == 7199
  end

  test "aoc2" do
    assert Aoc2_1.solve("lib/2/input.txt") == 18595663903
    assert Aoc2_2.solve("lib/2/input.txt") == 19058204438
  end

  test "aoc3" do
    assert Aoc3_1.solve("lib/3/input.txt") == 17263
    assert Aoc3_2.solve("lib/3/input.txt") == 170731717900423
  end

  test "aoc4" do
    assert Aoc4_1.solve("lib/4/input.txt") == 1527
    assert Aoc4_2.solve("lib/4/input.txt") == 8690
  end
end
