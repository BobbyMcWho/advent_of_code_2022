defmodule AdventOfCode.Day02 do
  def part1(_args) do
    parse_input()
    |> Enum.reduce(0, fn el, acc ->
      {_opponent, player} = calculate_round_score(el)
      acc + player
    end)
  end

  def part2(_args) do
    parse_input()
    |> Enum.reduce(0, fn el, acc ->
      {_opponent, player} =
        el
        |> choose_ideal_move()
        |> calculate_round_score()

      acc + player
    end)
  end

  def parse_input() do
    AdventOfCode.Input.get!(2)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn string ->
      String.split(string, " ")
      |> List.to_tuple()
    end)
  end

  # Ideally I would have translated these to atoms, but I don't wanna spend the time,
  # so I'm just gonna use the strings that now have dual meaning.
  def choose_ideal_move(match = {_opponent, _desired_outcome}) do
    case match do
      {"A", "X"} -> {"A", "Z"}
      {"A", "Y"} -> {"A", "X"}
      {"A", "Z"} -> {"A", "Y"}
      {"B", "X"} -> {"B", "X"}
      {"B", "Y"} -> {"B", "Y"}
      {"B", "Z"} -> {"B", "Z"}
      {"C", "X"} -> {"C", "Y"}
      {"C", "Y"} -> {"C", "Z"}
      {"C", "Z"} -> {"C", "X"}
    end
  end

  def calculate_round_score({_player1 = "A", _player2 = "X"}), do: {4, 4}
  def calculate_round_score({_player1 = "A", _player2 = "Y"}), do: {1, 8}
  def calculate_round_score({_player1 = "A", _player2 = "Z"}), do: {7, 3}
  def calculate_round_score({_player1 = "B", _player2 = "X"}), do: {8, 1}
  def calculate_round_score({_player1 = "B", _player2 = "Y"}), do: {5, 5}
  def calculate_round_score({_player1 = "B", _player2 = "Z"}), do: {2, 9}
  def calculate_round_score({_player1 = "C", _player2 = "X"}), do: {3, 7}
  def calculate_round_score({_player1 = "C", _player2 = "Y"}), do: {9, 2}
  def calculate_round_score({_player1 = "C", _player2 = "Z"}), do: {6, 6}
end
