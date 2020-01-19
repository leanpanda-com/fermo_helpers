defmodule FermoHelpers.DateTime do
  @moduledoc ~S"""
  Note: If you want to use `current_datetime/1`, you need to include
  the following dependency:

  ```elixir
  {:tzdata, "~> 1.0"}
  ```

  and add a config option

  ```elixir
  config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase
  ```
  """

  def current_datetime(zone \\ "Etc/UTC") do
    {:ok, datetime} = DateTime.now(zone)
    datetime
  end

  def datetime_to_rfc2822(datetime) do
    Calendar.DateTime.Format.rfc2822(datetime)
  end

  def strftime!(datetime, format) when is_binary(datetime) do
    datetime
    |> Calendar.Date.Parse.iso8601!()
    |> strftime!(format)
  end
  def strftime!(datetime, format) do
    Calendar.Strftime.strftime!(datetime, format)
  end
end
