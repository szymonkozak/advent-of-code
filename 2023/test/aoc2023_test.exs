defmodule Aoc2023Test do
  use ExUnit.Case
  doctest Aoc2023

  test "aoc1" do
    assert Aoc1_1.solve("lib/1/input.txt") == 54081
    assert Aoc1_2.solve("lib/1/input.txt") == 54649
  end

  test "aoc2" do
    assert Aoc2_1.solve("lib/2/input.txt") == 1867
    assert Aoc2_2.solve("lib/2/input.txt") == 84538
  end

  test "aoc3" do
    assert Aoc3_1.solve("lib/3/input.txt") == 553_825
    assert Aoc3_2.solve("lib/3/input.txt") == 93_994_191
  end

  test "aoc4" do
    assert Aoc4_1.solve("lib/4/input.txt") == 23673
    assert Aoc4_2.solve("lib/4/input.txt") == 12_263_631
  end

  test "aoc6" do
  assert Aoc6_1.solve("lib/6/input.txt") == 275_724
  assert Aoc6_2.solve(59_688_274, 543_102_016_641_022) == 37_286_485
  end

  test "aoc8" do
  assert Aoc8_1.solve("lib/8/input.txt") == 14681
  assert Aoc8_2.solve("lib/8/input.txt") == 14321394058031
  end

  test "aoc9" do
    assert Aoc9_1.solve("lib/9/input.txt") == 1_930_746_032
    assert Aoc9_2.solve("lib/9/input.txt") == 1154
  end
end
