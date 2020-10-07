defmodule Dryve.Repo.Migrations.AddFuzzystrmatchExtension do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;",
            "DROP EXTENSION IF EXISTS fuzzystrmatch;"
  end
end
