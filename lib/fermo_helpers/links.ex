defmodule FermoHelpers.Links do
  def link_to(href, [do: content] = _other) do
    link_to(content, href, [])
  end
  def link_to(text, href) when is_binary(text) and is_binary(href) do
    "<a href=\"#{href}\">#{text}</a>"
  end

  def link_to(text, nil, attributes) when is_binary(text) and is_list(attributes) do
    attribs = to_attributes(attributes)
    "<a #{Enum.join(attribs, " ")}>#{text}</a>"
  end
  def link_to(href, attributes, [do: content] = _other) when is_binary(href) and is_list(attributes) do
    link_to(content, href, attributes)
  end
  def link_to(text, href, attributes) when is_binary(text) and is_binary(href) and is_list(attributes) do
    attribs = to_attributes(attributes)
    "<a href=\"#{href}\" #{Enum.join(attribs, " ")}>#{text}</a>"
  end

  defp to_attributes(attributes) do
    Enum.map(attributes, &(to_attribute(&1)))
  end

  defp to_attribute({k, v}) when is_binary(v) do
    "#{k}=\"#{v}\""
  end
  defp to_attribute({k, value}) when is_map(value) do
    value
    |> Enum.reduce([], fn {k2, v2}, acc ->
      ["#{k}-#{k2}=\"#{v2}\"" | acc]
    end)
    |> Enum.reverse
  end

  def mail_to(email, caption \\ nil, _mail_options \\ %{}) do
    # TODO handle _mail_options
    mail_href = "mailto:#{email}"
    link_to((caption || email), mail_href)
  end
end
