defmodule Dryve.Cars.Car do
  use Ecto.Schema
  import Ecto.Changeset

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

  def adjacent_prices do
    query = """
      WITH base AS (
        SELECT lag(price, 2) OVER (ORDER BY price) lag,
        lead(price, 2) OVER (ORDER BY price) lead,
        c.*
        FROM cars c
      )
      SELECT base.* FROM base
      JOIN(
        SELECT lag, lead
        FROM base WHERE price = 5000
      ) sub ON base.price BETWEEN sub.lag AND sub.lead
    """

    Repo.query!(query)
  end
end
