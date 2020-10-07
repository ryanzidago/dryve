defmodule Dryve.Cars.Factory do
  use ExMachina.Ecto, repo: Dryve.Repo

  alias Dryve.Cars.Car

  def car_factory do
    make = Faker.Vehicle.make()
    model = Faker.Vehicle.model(make)
    price = Enum.random(4_000..100_000)
    vin = Faker.Vehicle.vin()
    kwh = Enum.random(100..500)

    %Car{
      engine_type: "electric",
      kwh: kwh,
      make: make,
      model: model,
      price: price,
      vin: vin
    }
  end
end
