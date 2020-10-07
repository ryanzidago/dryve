# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Dryve.Repo.insert!(%Dryve.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Dryve.{Repo, Cars.Car}

for _n <- 1..10 do
  make = Faker.Vehicle.make()
  model = Faker.Vehicle.model(make)
  price = Enum.random(4_000..100_000)
  vin = Faker.Vehicle.vin()
  kwh = Enum.random(100..500)

  %Car{}
  |> Car.changeset(%{
    engine_type: "electric",
    kwh: kwh,
    make: make,
    model: model,
    price: price,
    vin: vin
  })
  |> Repo.insert!()

  make = Faker.Vehicle.make()
  model = Faker.Vehicle.model(make)
  price = Enum.random(4_000..100_000)
  vin = Faker.Vehicle.vin()
  mpg = Enum.random(50..100)

  %Car{}
  |> Car.changeset(%{
    engine_type: "gasoline",
    mpg: mpg,
    make: make,
    model: model,
    price: price,
    vin: vin
  })
  |> Repo.insert!()
end
