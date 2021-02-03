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
    |> String.to_charlist
    |> Enum.map(fn e -> rotate_char(e, shift) end )
    |> List.to_string
  end

  defp rotate_char(char_code, shift) do
    cond do
      char_code >= 65 and char_code <= 90 -> shift_from_base(char_code, 65, shift)
      char_code >= 97 and char_code <= 122 -> shift_from_base(char_code, 97, shift)
      true -> char_code
    end
  end

  defp shift_from_base(char_code, base, shift) do
    rem((char_code - base + shift), 26) + base
  end
end
