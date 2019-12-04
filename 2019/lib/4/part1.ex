defmodule Aoc4_1 do
  def solve(from, to) do
    from..to
    |> Enum.map(&Integer.digits/1)
    |> Enum.filter(fn digits ->
      !is_decrease(digits) && is_doubled_digit(digits)
    end)
    |> length()
  end

  defp is_decrease(password_digits) do
    case password_digits do
      [_] -> false
      [a | [b | tail]] when a <= b -> is_decrease([b | tail])
      [a | b] -> a <= b
      _ -> true
    end
  end

  defp is_doubled_digit(password_digits) do
    set_size = MapSet.size(MapSet.new(password_digits))
    set_size != length(password_digits)
  end
end
