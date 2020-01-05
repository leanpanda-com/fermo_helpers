defmodule FermoHelpers.String do
  def parameterize(string) do
    string
    |> String.replace(~r<[^a-z0-9\-_]+>i, "-")
    |> String.downcase()
  end

  def underscore(string) do
    path = String.replace(string, ~r<::>, "/")
    Regex.replace(
      ~r<([a-z])([A-Z])>,
      path,
      fn _match, cap, lower -> "#{String.downcase(cap)}#{lower}" end
    )
  end
end
