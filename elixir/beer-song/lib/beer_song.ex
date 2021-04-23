defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{line_one(number)}
    #{line_two(number)}
    """
  end

  defp line_one(0), do: "No more bottles of beer on the wall, no more bottles of beer."
  defp line_one(number), do: "#{bottles(number)} of beer on the wall, #{bottles(number)} of beer."

  defp line_two(0), do: "Go to the store and buy some more, 99 bottles of beer on the wall."
  defp line_two(1), do: "Take it down and pass it around, no more bottles of beer on the wall."
  defp line_two(number), do: "Take one down and pass it around, #{bottles(number - 1)} of beer on the wall."

  defp bottles(1), do: "1 bottle"
  defp bottles(number), do: "#{number} bottles"

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    range
    |> Enum.to_list()
    |> lyrics("")
  end

  defp lyrics([], text), do: text

  defp lyrics([verse_number | rest], "") do
    text = verse(verse_number)
    lyrics(rest, text)
  end

  defp lyrics([verse_number | rest], text) do
    text = text <> "\n" <> verse(verse_number)
    lyrics(rest, text)
  end

  # @spec lyrics(Range.t()) :: String.t()
  # def lyrics(range \\ 99..0) do
  #   range
  #   |> Enum.map(&verse/1)
  #   |> Enum.join("\n")
  # end
end
