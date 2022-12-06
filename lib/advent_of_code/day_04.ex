defmodule AdventOfCode.Day04 do
  def part1(_args) do
    AdventOfCode.Input.get!(4)
    |> String.trim()
    |> String.split("\n")
    |> Enum.reduce(0, fn line, acc ->
      String.split(line, ",")
      |> Enum.map(&assignment_range_from_string/1)
      |> range_fully_overlaps_other()
      |> case do
        true -> acc + 1
        false -> acc
      end
    end)
  end

  def range_fully_overlaps_other([range1, range2]) do
    range_fully_overlaps_other(range1, range2)
  end

  def range_fully_overlaps_other(range1, range2) do
    range1_set = MapSet.new(range1)
    range2_set = MapSet.new(range2)
    MapSet.subset?(range1_set, range2_set) or MapSet.subset?(range2_set, range1_set)
  end

  def range_partially_overlaps_other([range1, range2]) do
    range_partially_overlaps_other(range1, range2)
  end

  def range_partially_overlaps_other(range1, range2) do
    range1_set = MapSet.new(range1)
    range2_set = MapSet.new(range2)
    MapSet.intersection(range1_set, range2_set) != MapSet.new()
  end

  def assignment_range_from_string(string) do
    [start, finish] = String.split(string, "-") |> Enum.map(&String.to_integer/1)
    start..finish
  end

  @spec part2(any) :: nil
  def part2(_args) do
    AdventOfCode.Input.get!(4)
    |> String.trim()
    |> String.split("\n")
    |> Enum.reduce(0, fn line, acc ->
      String.split(line, ",")
      |> Enum.map(&assignment_range_from_string/1)
      |> range_partially_overlaps_other()
      |> case do
        true -> acc + 1
        false -> acc
      end
    end)
  end
end
