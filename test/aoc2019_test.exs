defmodule Aoc2019Test do
  use ExUnit.Case
  doctest Aoc2019

  test "aoc1" do
    assert Aoc1.solve("../input1.txt") == 5265045
  end
end
