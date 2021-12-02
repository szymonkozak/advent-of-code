defmodule Aoc2021Test do
  use ExUnit.Case
  doctest Aoc2021

  test "aoc1" do
    assert Aoc1_1.solve("lib/1/input.txt") == 1233
    assert Aoc1_2.solve("lib/1/input.txt") == 1275
  end
end
