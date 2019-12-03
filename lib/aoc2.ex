defmodule Aoc2 do
  def solve(input, value) do
    input
    |> File.read!()
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> search_pair(value)
    |> result()
    |> IO.inspect()
  end

  defp search_pair(input, value) do
    for n <- 1..99, v <- 1..99 do
      {n, v}
    end
    |> Enum.find(fn {n, v} -> get_output(input, {n, v}) == value end)
  end

  defp get_output(input, {n, v}) do
    input
    |> List.replace_at(1, n)
    |> List.replace_at(2, v)
    |> execute()
    |> Enum.at(0)
  end

  defp execute(list), do: execute(list, 0)

  defp execute(list, offset) do
    case Enum.at(list, offset) do
      1 -> execute(list, offset, &Kernel.+/2)
      2 -> execute(list, offset, &Kernel.*/2)
      99 -> list
    end
  end

  defp execute(list, offset, operation) do
    execute(calculate_new_list(list, offset, operation), offset + 4)
  end

  defp calculate_new_list(list, offset, operation) do
    List.replace_at(
      list,
      Enum.at(list, offset + 3),
      operation.(
        Enum.at(list, Enum.at(list, offset + 1)),
        Enum.at(list, Enum.at(list, offset + 2))
      )
    )
  end

  defp result({n, v}), do: 100 * n + v
end
