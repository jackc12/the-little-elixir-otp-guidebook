defmodule Exercises do
  def sum([]), do: 0

  def sum([head | tail]) do
    sum(head) + sum(tail)
  end

  def sum(item), do: item

  def transform(list) do
    list
    |> List.flatten()
    |> Enum.map(&(&1 * &1))
    |> Enum.sort(:desc)
  end
end
