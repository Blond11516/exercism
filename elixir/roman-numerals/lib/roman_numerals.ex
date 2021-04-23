defmodule RomanNumerals do
  @conversions %{
    1 => %{unit: "I", mid: "V", last: "IX"},
    2 => %{unit: "X", mid: "L", last: "XC"},
    3 => %{unit: "C", mid: "D", last: "CM"}
  }

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    number
    |> Integer.digits()
    |> (&Enum.zip(&1, length(&1)..1)).()
    |> Enum.map(&convert_number/1)
    |> Enum.join()
  end

  defp convert_number({number, 4}) do
    String.duplicate("M", number)
  end

  defp convert_number({0, _}) do
    ""
  end

  defp convert_number({4, power}) do
    @conversions[power].unit <> @conversions[power].mid
  end

  defp convert_number({5, power}) do
    @conversions[power].mid
  end

  defp convert_number({9, power}) do
    @conversions[power].last
  end

  defp convert_number({number, power}) when number < 4 do
    String.duplicate(@conversions[power].unit, number)
  end

  defp convert_number({number, power}) do
    @conversions[power].mid <> String.duplicate(@conversions[power].unit, number - 5)
  end
end
