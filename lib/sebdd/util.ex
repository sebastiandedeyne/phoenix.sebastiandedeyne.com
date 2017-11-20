defmodule Sebdd.Util do
  def parallel_map(enumerable, fun) do
    enumerable
    |> Enum.map(fn x ->
         Task.async(fn -> fun.(x) end)
       end)
    |> Enum.map(&Task.await/1)
  end
end
