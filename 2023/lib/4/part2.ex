defmodule Aoc4_2 do
  def solve(input) do
    original_cards =
      File.read!(input)
      |> String.split("\n")
      |> Enum.map(&read_card/1)
      |> Enum.map(&find_matches/1)

    copied_cards = copy_cards(original_cards)

    length(original_cards) + length(copied_cards)
  end

  defp read_card(line) do
    [card_no, winning, drawn] = String.split(line, ["Card ", ": ", " | "], trim: true)

    card_no = String.to_integer(String.trim(card_no))
    winning_numbers = parse_numbers(winning)
    drawn_numbers = parse_numbers(drawn)

    {card_no, winning_numbers, drawn_numbers}
  end

  defp find_matches({card_no, winning_numbers, drawn_numbers}) do
    found =
      MapSet.intersection(
        MapSet.new(winning_numbers),
        MapSet.new(drawn_numbers)
      )
      |> MapSet.size()

    {card_no, found}
  end

  defp copy_cards(initial_cards) do
    copy_cards(initial_cards, initial_cards)
  end

  defp copy_cards(_, []), do: []

  defp copy_cards(initial_cards, cards) do
    cards
    |> Enum.flat_map(fn {card_no, found} ->
      cards_to_copy =
        Enum.drop(initial_cards, card_no)
        |> Enum.take(found)

      case cards_to_copy do
        [] -> []
        _ -> cards_to_copy ++ copy_cards(initial_cards, cards_to_copy)
      end
    end)
  end

  defp parse_numbers(numbers) do
    numbers
    |> String.split(" ", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end
