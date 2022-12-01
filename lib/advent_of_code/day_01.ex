defmodule AdventOfCode.Day01 do
  def part1(_args) do
    parse_input()
    |> Enum.max()
  end

  def part2(_args) do
    parse_input()
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end

  def parse_input() do
    AdventOfCode.Input.get!(1)
    |> String.trim()
    |> String.split("\n\n")
    |> Enum.map(fn string ->
      String.split(string, "\n")
      |> Enum.map(&String.to_integer/1)
      |> Enum.sum()
    end)
  end
end
