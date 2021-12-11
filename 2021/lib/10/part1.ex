defmodule Aoc10_1 do
  @closing ["]", ">", "}", ")"]
  @opening ["[", "<", "{", "("]
  @closing_to_opening Enum.zip(@closing, @opening) |> Map.new()
  @scores %{")" => 3, "]" => 57, "}" => 1197, ">" => 25137}

  def solve(input) do
    parse(input)
    |> Enum.map(&String.codepoints/1)
    |> Enum.map(&find_incorrect/1)
    |> Enum.filter(& &1)
    |> Enum.map(&@scores[&1])
    |> Enum.sum()
  end

  defp find_incorrect(_, stack \\ [])
  defp find_incorrect([], _), do: nil

  defp find_incorrect([bracket | tail], stack) do
    cond do
      bracket in @opening ->
        find_incorrect(tail, [bracket | stack])

      bracket in @closing ->
        opening = @closing_to_opening[bracket]

        case stack do
          [^opening | stack] -> find_incorrect(tail, stack)
          _ -> bracket
        end
    end
  end

  defp parse(input) do
    File.read!(input)
    |> String.split("\n")
  end
end
