defmodule Utils do
  def read_lines(filename) do
    filename
    |> File.read!()
    |> String.split("\n")
  end
end
