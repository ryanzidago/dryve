defmodule Dryve.Repo.Migrations.ChangeVinTypeToCitext do
  use Ecto.Migration

  def change do
    alter table(:cars) do
      modify :vin, :citext
    end
  end
end
