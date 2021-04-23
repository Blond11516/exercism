defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.map(&rot_char(&1, shift))
    |> to_string()
  end

  defp rot_char(char, shift) when char >= ?a and char <= ?z, do: rot_char(char, shift, ?a, ?z)
  defp rot_char(char, shift) when char >= ?A and char <= ?Z, do: rot_char(char, shift, ?A, ?Z)
  defp rot_char(char, _), do: char

  defp rot_char(char, shift, lower, upper) do
    if char + shift > upper do
      lower + char + shift - upper - 1
    else
      char + shift
    end
  end
end
