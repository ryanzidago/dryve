defmodule Dryve.Cars.CarTest do
  use Dryve.DataCase, async: true
  import Dryve.Cars.Factory

  alias Dryve.Cars.Car

  describe "search_by_make_and_model/2" do
    test "returns by default the first three cars matching, ordering them by the most relevant match to the least" do
      _first_car = insert(:car, make: "Toyota", model: "Camry")
      _second_car = insert(:car, make: "Toyota", model: "Camry")
      _third_car = insert(:car, make: "Toyota", model: "Corrola")

      [first_car, second_car, third_car] = Car.search_by_make_and_model("Toyota", "Camry")

      assert first_car.model == "Camry"
      assert second_car.model == "Camry"
      assert third_car.model == "Corrola"
    end
  end

  describe "search_by_make_and_model/5" do
    test "returns the first cars matching, ordering them by the most relevant match to the least" do
      _first_car = insert(:car, make: "Toyota", model: "Camry")
      _second_car = insert(:car, make: "Toyota", model: "Camry")
      _third_car = insert(:car, make: "Toyota", model: "Corrola")
      _other_cars = insert_list(17, :car, make: "Peugot", model: "206")

      [first_car, second_car, third_car | _other_cars] =
        Car.search_by_make_and_model("Toyota", "Camry")

      assert first_car.model == "Camry"
      assert second_car.model == "Camry"
      assert third_car.model == "Corrola"
    end
  end
end
