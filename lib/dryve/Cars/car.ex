defmodule Dryve.Cars.Car do
  use Ecto.Schema
  import Ecto.Changeset

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

    timestamps()
  end

  @allowed_fields [
    :engine_type,
    :mpg,
    :kwh,
    :price,
    :make,
    :model
  ]

  def changeset(car, params \\ %{}) do
    car
    |> cast(params, @allowed_fields)
    |> check_constraint(:engine_type, name: :mutually_exclusive)
  end
end
