defmodule FermoHelpers.I18n do
  @doc false
  defmacro __using__(_opts) do
    quote do
      require FermoHelpers.I18n

      def t(key, parameters \\ %{}, locale) do
        I18n.translate!(key, parameters, locale)
      end
    end
  end

  def start_link() do
    I18n.start_link()
  end

  def load!(path \\ "priv/locales/**/*.yml") do
    files = Path.wildcard(path)
    translations = Enum.reduce(files, %{}, fn (file, translations) ->
      content = YamlElixir.read_from_file(file)
      {:ok, atom_keys} = Morphix.atomorphiform(content)
      DeepMerge.deep_merge(translations, atom_keys)
    end)
    {:ok} = I18n.put(translations)
  end
end
