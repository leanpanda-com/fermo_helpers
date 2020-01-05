defmodule FermoHelpers.DateTime do
  def current_datetime(zone \\ "Etc/UTC") do
    {:ok, datetime} = DateTime.now(zone)
    datetime
  end

  def datetime_to_rfc2822(datetime) do
    Calendar.DateTime.Format.rfc2822(datetime)
  end
end
