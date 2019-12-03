defmodule Aoc2019Test do
  use ExUnit.Case
  doctest Aoc2019

  test "aoc1" do
    assert Aoc1.solve("input1.txt") == 5_265_045
  end

  test "aoc2" do
    assert Aoc2.solve("input2.txt", 19_690_720) == 7749
  end
end
