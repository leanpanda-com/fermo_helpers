defmodule FermoHelpers.Slug do
  @moduledoc """
  Create slugs from id and text
  """

  @doc ~S"""
  Returns a slug, combining id and title.

  ## Example

      iex> FermoHelpers.Slug.from(123, "ciao")
      "123-ciao"

  ## Normalization

  Punctuation is replaced by '-':

      iex> FermoHelpers.Slug.from(123, "S&P")
      "123-s-p"

  The title is downcased:

      iex> FermoHelpers.Slug.from(123, "AAAAA")
      "123-aaaaa"

  Non-Latin characters are transliterated:

      iex> FermoHelpers.Slug.from(123, "andò")
      "123-ando"

  Separator characters are converted to '-':

      iex> FermoHelpers.Slug.from(123, "R&R")
      "123-r-r"

  Leading '-' is removed:

      iex> FermoHelpers.Slug.from(123, "-1")
      "123-1"

  Trailing '-' is removed:

      iex> FermoHelpers.Slug.from(123, "1-")
      "123-1"

  The text part is capped at 51 characters:

      iex> FermoHelpers.Slug.from(123, String.duplicate("a", 100))
      "123-aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  """

  @max_text 51
  @transform_to_hyphen ~r([‐' ’,&+.#/@!:°])u

  def from(id, title, options \\ []) do
    max_text = options[:max_text] || @max_text
    clean =
      :unicode.characters_to_nfd_binary(title)
      |> String.replace(@transform_to_hyphen, "-")
      |> String.replace("ø", "o")
      |> String.replace(~r/[^0-9\-A-z]/u, "")
      |> String.downcase
    stripped =
      String.replace_leading(clean, "-", "")
      |> String.replace_trailing("-", "")
    deduped = String.replace(stripped, ~r/\-\-+/u, "-")
    sliced = String.slice(deduped, 0, max_text)
    "#{id}-#{sliced}"
  end
end
