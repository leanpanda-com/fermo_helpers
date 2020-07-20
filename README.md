# FermoHelpers

# Assets

Your webpack.config.js should produce a manifest as `build/manifest.json`:

```js
const ManifestPlugin = require('webpack-manifest-plugin')

module.exports = {
  ..
  output: {
    path: __dirname + '/build',
    ...
  },
  ...
  plugins: [
    ...
    new ManifestPlugin()
  ]
}
```

In your Fermo `build/0`, run the Webpack asset pipeline:

```elixir
def build do
  ...
  config = FermoHelpers.Assets.build(config)
  ...
end
```

You can then use these helpers,
such as `javascript_include_tag`, and you will pick up the
correctly hashed filenames.

* `javascript_include_tag/n`

# Date

# DateTime

* `current_datetime/1`
* `datetime_to_rfc2822/1`
* `strftime/2`

## Timezone Information

Note: If you want to use `current_datetime/1`, you need to include
the following dependency:

```elixir
{:tzdata, "~> 1.0"}
```

and add a config option

```elixir
config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase
```

# Html

# I18n

# Links

# String

# Text
