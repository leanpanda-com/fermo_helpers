defmodule FermoHelpers.HTML do
  @escape_html %{
    "&" => "&amp;",
    "<" => "&lt;",
    ">" => "&gt;",
    "'" => "&#x27;",
    '"' => "&quot;",
    "/" => "&#x2F;"
  }
  @escape_html_pattern Enum.join(Map.keys(@escape_html), "|")
  @escape_html_regex Regex.compile!(@escape_html_pattern)

  # Adapted from https://github.com/rack/rack/blob/master/lib/rack/utils.rb
  # Escape ampersands, brackets and quotes to their HTML/XML entities.
  def escape_html(string) do
    String.replace(string, @escape_html_regex, &(@escape_html[&1]))
  end
end
