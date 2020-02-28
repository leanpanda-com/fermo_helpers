defmodule FermoHelpers.I18n do
  def t(key, parameters \\ %{}, locale) do
    I18n.translate!(key, parameters, locale)
  end
end
