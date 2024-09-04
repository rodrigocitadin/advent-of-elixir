defmodule AdventOfElixir.Day1 do
  def run() do
    "data/day_1.txt"
    |> File.stream!()
    |> Enum.map(&count_digits/1)
    |> Enum.sum()
  end

  def count_digits(line) do
    {result, _} =
      line
      |> String.trim()
      |> String.graphemes()
      |> Enum.filter(&verify_digit/1)
      |> join_first_and_last()
      |> Integer.parse()

    result
  end

  defp verify_digit(char) do
    case Integer.parse(char) do
      {_num, _} -> true
      :error -> false
    end
  end

  defp join_first_and_last(list), do: List.first(list) <> List.last(list)
end
