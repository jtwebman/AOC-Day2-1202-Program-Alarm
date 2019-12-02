defmodule GravityAssist do
  @input [
    1,
    0,
    0,
    3,
    1,
    1,
    2,
    3,
    1,
    3,
    4,
    3,
    1,
    5,
    0,
    3,
    2,
    10,
    1,
    19,
    1,
    19,
    6,
    23,
    2,
    13,
    23,
    27,
    1,
    27,
    13,
    31,
    1,
    9,
    31,
    35,
    1,
    35,
    9,
    39,
    1,
    39,
    5,
    43,
    2,
    6,
    43,
    47,
    1,
    47,
    6,
    51,
    2,
    51,
    9,
    55,
    2,
    55,
    13,
    59,
    1,
    59,
    6,
    63,
    1,
    10,
    63,
    67,
    2,
    67,
    9,
    71,
    2,
    6,
    71,
    75,
    1,
    75,
    5,
    79,
    2,
    79,
    10,
    83,
    1,
    5,
    83,
    87,
    2,
    9,
    87,
    91,
    1,
    5,
    91,
    95,
    2,
    13,
    95,
    99,
    1,
    99,
    10,
    103,
    1,
    103,
    2,
    107,
    1,
    107,
    6,
    0,
    99,
    2,
    14,
    0,
    0
  ]

  def solve() do
    solve_for(0, 0)
  end

  def solve_for(x, y) do
    test = try_solve(x, y)

    case test do
      val when val == 19_690_720 -> 100 * x + y
      _ -> solve_next(x, y)
    end
  end

  def solve_next(x, y) do
    case x do
      x when x <= 99 -> solve_for(x + 1, y)
      _ -> solve_next(0, y + 1)
    end
  end

  def solve_part1() do
    try_solve(12, 2)
  end

  def try_solve(noun, verb) do
    @input
    |> List.replace_at(1, noun)
    |> List.replace_at(2, verb)
    |> run()
    |> Enum.at(0)
  end

  def run(program) do
    step(program, 0)
  end

  def step(program, pos) do
    case Enum.at(program, pos) do
      instruction when instruction == 1 -> add(program, pos)
      instruction when instruction == 2 -> mutiply(program, pos)
      _ -> program
    end
  end

  def add(program, pos) do
    step(
      List.replace_at(
        program,
        Enum.at(program, pos + 3),
        Enum.at(program, Enum.at(program, pos + 1)) + Enum.at(program, Enum.at(program, pos + 2))
      ),
      pos + 4
    )
  end

  def mutiply(program, pos) do
    step(
      List.replace_at(
        program,
        Enum.at(program, pos + 3),
        Enum.at(program, Enum.at(program, pos + 1)) * Enum.at(program, Enum.at(program, pos + 2))
      ),
      pos + 4
    )
  end
end
