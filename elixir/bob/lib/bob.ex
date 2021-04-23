defmodule Bob do
  def hey(input) do
    input = String.trim(input)
    shouting? = shouting?(input)
    question? = question?(input)

    cond do
      input == "" -> "Fine. Be that way!"
      question? && shouting? -> "Calm down, I know what I'm doing!"
      question? -> "Sure."
      shouting? -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp shouting?(input) do
    upcased = String.upcase(input)
    downcased = String.downcase(input)
    upcased == input and upcased != downcased
  end

  defp question?(input), do: String.ends_with?(input, "?")
end
