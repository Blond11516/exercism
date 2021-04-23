defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """

  @transcriptions %{
    ?G => ?C,
    ?C => ?G,
    ?T => ?A,
    ?A => ?U
  }

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, fn nuc -> Map.get(@transcriptions, nuc) end)
  end
end
