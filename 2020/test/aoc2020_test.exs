defmodule Aoc2020Test do
  use ExUnit.Case
  doctest Aoc2020

  test "aoc2" do
    assert Aoc2_1.solve("lib/2/input.txt") == 640
    assert Aoc2_2.solve("lib/2/input.txt") == 472
  end
end
