defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.split(~r/[^[:alnum:]-]/u, trim: true)
    |> Enum.group_by(&String.downcase/1)
    |> Enum.map(fn {word, list} -> {word, length(list)} end)
    |> Map.new()
  end
end
