defmodule Dryve.Repo.Migrations.AddConstraintsOnEngineType do
  use Ecto.Migration

  def up do
    create constraint(
             :cars,
             :mutually_exclusive,
             check: "(engine_type = 'electric' AND mpg IS NULL)
              OR (engine_type = 'gasoline' AND kwh IS NULL)"
           )
  end
end
