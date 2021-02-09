defmodule Hello.RentalsTest do
  use Hello.DataCase

  alias Hello.Rentals

  describe "rentals" do
    alias Hello.Rentals.Rental

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def rental_fixture(attrs \\ %{}) do
      {:ok, rental} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Rentals.create_rental()

      rental
    end

    test "list_rentals/0 returns all rentals" do
      rental = rental_fixture()
      assert Rentals.list_rentals() == [rental]
    end

    test "get_rental!/1 returns the rental with given id" do
      rental = rental_fixture()
      assert Rentals.get_rental!(rental.id) == rental
    end

    test "create_rental/1 with valid data creates a rental" do
      assert {:ok, %Rental{} = rental} = Rentals.create_rental(@valid_attrs)
    end

    test "create_rental/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Rentals.create_rental(@invalid_attrs)
    end

    test "update_rental/2 with valid data updates the rental" do
      rental = rental_fixture()
      assert {:ok, %Rental{} = rental} = Rentals.update_rental(rental, @update_attrs)
    end

    test "update_rental/2 with invalid data returns error changeset" do
      rental = rental_fixture()
      assert {:error, %Ecto.Changeset{}} = Rentals.update_rental(rental, @invalid_attrs)
      assert rental == Rentals.get_rental!(rental.id)
    end

    test "delete_rental/1 deletes the rental" do
      rental = rental_fixture()
      assert {:ok, %Rental{}} = Rentals.delete_rental(rental)
      assert_raise Ecto.NoResultsError, fn -> Rentals.get_rental!(rental.id) end
    end

    test "change_rental/1 returns a rental changeset" do
      rental = rental_fixture()
      assert %Ecto.Changeset{} = Rentals.change_rental(rental)
    end
  end
end
