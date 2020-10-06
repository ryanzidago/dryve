defmodule Dryve.Repo.Migrations.CreateCarsTable do
  use Ecto.Migration

  def change do
    create table(:cars) do
      add :engine_type, :string
      add :mpg, :integer
      add :kwh, :integer
      add :price, :integer
      add :make, :string
      add :model, :string

      timestamps()
    end
  end
end
