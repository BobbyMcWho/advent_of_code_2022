defmodule AdventOfCode.Day03 do
  def part1(_args) do
    parse_input()
    |> Enum.map(fn string ->
      half = String.length(string) |> div(2)

      String.split_at(string, half)
    end)
    |> Enum.map(fn {compartment_1, compartment_2} ->
      mapset1 = MapSet.new(String.to_charlist(compartment_1))
      mapset2 = MapSet.new(String.to_charlist(compartment_2))

      MapSet.intersection(mapset1, mapset2)
      |> MapSet.to_list()
      |> List.first()
      |> codepoint_to_priority()
    end)
    |> Enum.sum()
  end

  def part2(_args) do
    parse_input()
    |> Enum.chunk_every(3)
    |> Enum.map(fn [compartment_1, compartment_2, compartment_3] ->
      mapset1 = MapSet.new(String.to_charlist(compartment_1))
      mapset2 = MapSet.new(String.to_charlist(compartment_2))
      mapset3 = MapSet.new(String.to_charlist(compartment_3))

      MapSet.intersection(mapset1, mapset2)
      |> MapSet.intersection(mapset3)
      |> MapSet.to_list()
      |> List.first()
      |> codepoint_to_priority()
    end)
    |> Enum.sum()
  end

  def parse_input do
    AdventOfCode.Input.get!(3)
    |> String.trim()
    |> String.split("\n")
  end

  def codepoint_to_priority(codepoint) when codepoint in ?a..?z do
    codepoint - 96
  end

  def codepoint_to_priority(codepoint) when codepoint in ?A..?Z do
    codepoint - 38
  end
end
