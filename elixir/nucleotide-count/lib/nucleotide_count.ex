defmodule NucleotideCount do
  @empty_histogram %{
    ?A => 0,
    ?C => 0,
    ?G => 0,
    ?T => 0
  }

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    Enum.filter(strand, fn nuc -> nuc == nucleotide end)
    |> length()
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    strand
    |> Enum.group_by(&Function.identity/1)
    |> Enum.reduce(@empty_histogram, fn {nuc, group}, hist ->
      Map.put(hist, nuc, length(group))
    end)
  end
end
