defmodule Dryve.Cars.Car do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias Dryve.Repo

  @doc """
  A car has
    * engine_type
      * if engine_type == "gasoline" then the car has a field `mpg`
      * if engine_type == "electric" then the car has a field `kwh`
    * vin (Vehicle Identification Number)
    * price
    * make
    * model
  """
  schema "cars" do
    field :engine_type, :string
    field :mpg, :integer
    field :kwh, :integer
    field :price, :integer
    field :make, :string
    field :model, :string
    field :vin, :string

    timestamps()
  end

  @allowed_fields [
    :engine_type,
    :mpg,
    :kwh,
    :price,
    :make,
    :model,
    :vin
  ]

  def changeset(car, params \\ %{}) do
    car
    |> cast(params, @allowed_fields)
    |> check_constraint(:engine_type, name: :mutually_exclusive)
  end

  def search_by_make_and_model(make, model, limit \\ 3) do
    from(
      c in __MODULE__,
      order_by: [
        asc:
          fragment(
            "LEAST(levenshtein(?, ?), levenshtein(?, ?))",
            c.model,
            ^model,
            c.make,
            ^make
          )
      ],
      limit: ^limit
    )
  end
end
