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

  test "aoc4" do
    assert Aoc4_1.solve("lib/4/input.txt") == 8442
    assert Aoc4_2.solve("lib/4/input.txt") == 4590
  end

  test "aoc5" do
    assert Aoc5_1.solve("lib/5/input.txt") == 4826
    assert Aoc5_2.solve("lib/5/input.txt") == 16793
  end

  test "aoc6" do
    assert Aoc6_1.solve("lib/6/input.txt") == 390923
    assert Aoc6_2.solve("lib/6/input.txt") == 1749945484935
  end

  test "aoc7" do
    assert Aoc7_1.solve("lib/7/input.txt") == 344735
    assert Aoc7_2.solve("lib/7/input.txt") == 96798233
  end

  test "aoc8" do
    assert Aoc8_1.solve("lib/8/input.txt") == 416
    assert Aoc8_2.solve("lib/8/input.txt") == 1043697
  end

  test "aoc9" do
    assert Aoc9_1.solve("lib/9/input.txt") == 526
    assert Aoc9_2.solve("lib/9/input.txt") == 1123524
  end

  test "aoc10" do
    assert Aoc10_1.solve("lib/10/input.txt") == 367059
    assert Aoc10_2.solve("lib/10/input.txt") == 1952146692
  end
end
