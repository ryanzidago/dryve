defmodule Dryve.Repo do
  use Ecto.Repo,
    otp_app: :dryve,
    adapter: Ecto.Adapters.Postgres
end
