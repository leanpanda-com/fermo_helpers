defmodule FermoHelpers.Date do
  def current_date do
    Date.utc_today()
  end

  def date_formatted(date) do
    Date.to_string(date)
  end
end
