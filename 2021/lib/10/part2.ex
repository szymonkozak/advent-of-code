defmodule Aoc10_2 do
  @closing ["]", ">", "}", ")"]
  @opening ["[", "<", "{", "("]
  @closing_to_opening Enum.zip(@closing, @opening) |> Map.new()
  @opening_to_closing Enum.zip(@opening, @closing) |> Map.new()
  @scores %{")" => 1, "]" => 2, "}" => 3, ">" => 4}

  def solve(input) do
    parse(input)
    |> Enum.map(&String.codepoints/1)
    |> Enum.map(&find_incomplete/1)
    |> Enum.filter(& &1)
    |> Enum.map(&calculate_score/1)
    |> Enum.sort()
    |> select_middle()
  end

  defp calculate_score(closing_brackets) do
    Enum.reduce(closing_brackets, 0, fn bracket, score ->
      score * 5 + @scores[bracket]
    end)
  end

  defp select_middle(scores) do
    middle = length(scores) |> div(2)
    Enum.at(scores, middle)
  end

  defp find_incomplete(_, stack \\ [])
  defp find_incomplete([], stack), do: Enum.map(stack, &@opening_to_closing[&1])

  defp find_incomplete([bracket | tail], stack) do
    cond do
      bracket in @opening ->
        find_incomplete(tail, [bracket | stack])

      bracket in @closing ->
        opening = @closing_to_opening[bracket]

        case stack do
          [^opening | stack] -> find_incomplete(tail, stack)
          _ -> nil
        end
    end
  end

  defp parse(input) do
    File.read!(input)
    |> String.split("\n")
  end
end
