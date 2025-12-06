defmodule Aoc3_2 do
  def solve(input) do
    full_map = parse(input)

    Enum.map(full_map, fn {coords, elem} ->
      {coords, {elem, find_adjacent_symbols(full_map, coords)}}
    end)
    |> Enum.map(fn {{x, y}, elem} -> {{y, x}, elem} end)
    |> Enum.sort()
    |> calculate_sum()
  end

  defp calculate_sum(map) do
    chunk_fun = fn elem, acc ->
      case elem do
        {_coords, {{:number, _num}, _}} = val -> {:cont, acc ++ [val]}
        _ -> {:cont, acc, []}
      end
    end

    after_fun = fn
      [] -> {:cont, []}
    end

    Enum.chunk_while(map, [], chunk_fun, after_fun)
    |> Enum.reject(&Enum.empty?/1)
    |> Enum.reject(fn numbers ->
      Enum.all?(numbers, &match?({_, {_, []}}, &1))
    end)
    |> Enum.map(fn numbers ->
      adjacent_symbols =
        Enum.flat_map(numbers, fn {_, {{_, _}, symbols}} -> symbols end) |> Enum.uniq()

      number =
        Enum.map(numbers, fn {_, {{:number, num}, _}} -> num end)
        |> Integer.undigits()

      {number, adjacent_symbols}
    end)
    |> Enum.group_by(fn {_, adjacent_symbols} -> adjacent_symbols end)
    |> Enum.reject(fn {_, result} ->
      Enum.count(result) != 2
    end)
    |> Enum.map(fn {_, [{n1, _}, {n2, _}]} -> n1 * n2 end)
    |> Enum.sum()
  end

  def find_adjacent_symbols(map, {x, y}) do
    [{1, 0}, {-1, 0}, {0, 1}, {0, -1}, {1, 1}, {-1, 1}, {-1, -1}, {1, -1}]
    |> Enum.map(fn {x_o, y_o} -> {x + x_o, y + y_o} end)
    |> Enum.filter(fn {x, y} -> Map.get(map, {x, y}) in [:symbol, :gear] end)
  end

  defp parse(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.with_index()
    |> Enum.reduce(%{}, fn {line, row}, map ->
      String.codepoints(line)
      |> Enum.map(&parse_element/1)
      |> Enum.with_index()
      |> Map.new(fn {elem, col} -> {{col, row}, elem} end)
      |> Map.merge(map)
    end)
  end

  defp parse_element(elem) do
    case Integer.parse(elem) do
      {num, ""} ->
        {:number, num}

      :error ->
        case elem do
          "." -> :empty
          "*" -> :gear
          _ -> :symbol
        end
    end
  end
end
