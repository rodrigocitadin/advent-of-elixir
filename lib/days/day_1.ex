defmodule AdventOfElixir.Day1 do
  def run() do
    "data/day_1.txt"
    |> File.stream!()
    |> Enum.map(&verify_lines/1)
    |> Enum.sum()
  end

  def verify_lines(line) do
    line
    |> digitify()
    |> sum_first_and_last()
  end

  def sum_first_and_last(list), do: List.first(list) * 10 + List.last(list)

  def digitify(<<"one", _::binary>> = str), do: [1 | digitify(tail(str))]
  def digitify(<<"two", _::binary>> = str), do: [2 | digitify(tail(str))]
  def digitify(<<"three", _::binary>> = str), do: [3 | digitify(tail(str))]
  def digitify(<<"four", _::binary>> = str), do: [4 | digitify(tail(str))]
  def digitify(<<"five", _::binary>> = str), do: [5 | digitify(tail(str))]
  def digitify(<<"six", _::binary>> = str), do: [6 | digitify(tail(str))]
  def digitify(<<"seven", _::binary>> = str), do: [7 | digitify(tail(str))]
  def digitify(<<"eight", _::binary>> = str), do: [8 | digitify(tail(str))]
  def digitify(<<"nine", _::binary>> = str), do: [9 | digitify(tail(str))]
  def digitify(<<c, _::binary>> = str) when c in ?0..?9, do: [c - ?0 | digitify(tail(str))]
  def digitify(<<_, rest::binary>>), do: digitify(rest)
  def digitify(""), do: []

  def tail(<<_, rest::binary>>), do: rest

  # first part solution
  # def run() do
  #   "data/day_1.txt"
  #   |> File.stream!()
  #   |> Enum.map(&count_digits/1)
  #   |> Enum.sum()
  # end

  # def count_digits(line) do
  #   {result, _} =
  #     line
  #     |> String.trim()
  #     |> String.graphemes()
  #     |> Enum.filter(&verify_digit/1)
  #     |> join_first_and_last()
  #     |> Integer.parse()

  #   result
  # end

  # defp verify_digit(char) do
  #   case Integer.parse(char) do
  #     {_num, _} -> true
  #     :error -> false
  #   end
  # end

  # defp join_first_and_last(list), do: List.first(list) <> List.last(list)
end
