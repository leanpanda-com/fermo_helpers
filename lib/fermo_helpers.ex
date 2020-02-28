defmodule FermoHelpers do
  @moduledoc """
  Documentation for FermoHelpers.
  """

  def start_link(servers) when is_list(servers) do
    Enum.each(servers, &(start_link(&1)))
    {:ok}
  end

  def start_link(:assets) do
    Assets.start_link()
    {:ok}
  end

  def start_link(:i18n) do
    I18n.start_link()
    {:ok}
  end

  # assets

  def build_assets() do
    {:ok} = Assets.build()
  end

  # i18n

  def load_i18n(path \\ "priv/locales/**/*.yml") do
    files = Path.wildcard(path)
    translations = Enum.reduce(files, %{}, fn (file, translations) ->
      content = YamlElixir.read_from_file(file)
      {:ok, atom_keys} = Morphix.atomorphiform(content)
      DeepMerge.deep_merge(translations, atom_keys)
    end)
    {:ok} = I18n.put(translations)
  end
end
