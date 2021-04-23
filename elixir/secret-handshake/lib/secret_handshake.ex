defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """

  @commands %{
    0 => "wink",
    1 => "double blink",
    2 => "close your eyes",
    3 => "jump"
  }

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    code
    |> Integer.digits(2)
    |> drop_higher_bits()
    |> decode()
  end

  defp drop_higher_bits(code) when length(code) > 5 do
    code
    |> Enum.drop(length(code) - 5)
  end

  defp drop_higher_bits(code), do: code

  defp decode([1 | rest]) when length(rest) == 4 do
    rest
    |> decode([])
    |> Enum.reverse()
  end

  defp decode(code) do
    code
    |> decode([])
  end

  defp decode([1 | rest], command_list) do
    command_list = [Map.get(@commands, length(rest)) | command_list]
    decode(rest, command_list)
  end

  defp decode([0 | rest], command_list) do
    decode(rest, command_list)
  end

  defp decode([], command_list), do: command_list
end
