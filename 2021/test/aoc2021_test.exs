defmodule Aoc2021Test do
  use ExUnit.Case
  doctest Aoc2021

  test "aoc1" do
    assert Aoc1_1.solve("lib/1/input.txt") == 1233
    assert Aoc1_2.solve("lib/1/input.txt") == 1275
  end

  test "aoc2" do
    assert Aoc2_1.solve("lib/2/input.txt") == 1_936_494
    assert Aoc2_2.solve("lib/2/input.txt") == 1_997_106_066
  end

  test "aoc3" do
    assert Aoc3_1.solve("lib/3/input.txt") == 2_640_986
    assert Aoc3_2.solve("lib/3/input.txt") == 6_822_109
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
    assert Aoc6_1.solve("lib/6/input.txt") == 390_923
    assert Aoc6_2.solve("lib/6/input.txt") == 1_749_945_484_935
  end

  test "aoc7" do
    assert Aoc7_1.solve("lib/7/input.txt") == 344_735
    assert Aoc7_2.solve("lib/7/input.txt") == 96_798_233
  end

  test "aoc8" do
    assert Aoc8_1.solve("lib/8/input.txt") == 416
    assert Aoc8_2.solve("lib/8/input.txt") == 1_043_697
  end

  test "aoc9" do
    assert Aoc9_1.solve("lib/9/input.txt") == 526
    assert Aoc9_2.solve("lib/9/input.txt") == 1_123_524
  end

  test "aoc10" do
    assert Aoc10_1.solve("lib/10/input.txt") == 367_059
    assert Aoc10_2.solve("lib/10/input.txt") == 1_952_146_692
  end

  test "aoc11" do
    assert Aoc11_1.solve("lib/11/input.txt") == 1601
    assert Aoc11_2.solve("lib/11/input.txt") == 368
  end

  test "aoc13" do
    assert Aoc13_1.solve("lib/13/input.txt") == 743

    assert Aoc13_2.solve("lib/13/input.txt", print: false) ==
             "###   ##  ###  #     ##  #  # #  # #   \n#  # #  # #  # #    #  # # #  #  # #   \n#  # #    #  # #    #  # ##   #### #   \n###  #    ###  #    #### # #  #  # #   \n# #  #  # #    #    #  # # #  #  # #   \n#  #  ##  #    #### #  # #  # #  # ####"
  end
end
