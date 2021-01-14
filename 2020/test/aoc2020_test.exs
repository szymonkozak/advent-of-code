defmodule Aoc2020Test do
  use ExUnit.Case
  doctest Aoc2020

  test "aoc1" do
    assert Aoc1_1.solve("lib/1/input.txt") == 876459
    assert Aoc1_2.solve("lib/1/input.txt") == 116168640
  end

  test "aoc2" do
    assert Aoc2_1.solve("lib/2/input.txt") == 640
    assert Aoc2_2.solve("lib/2/input.txt") == 472
  end

  test "aoc3" do
    assert Aoc3_1.solve("lib/3/input.txt") == 220
    assert Aoc3_2.solve("lib/3/input.txt") == 2138320800
  end
end
