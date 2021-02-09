defmodule HelloWeb.RentalControllerTest do
  use HelloWeb.ConnCase

  alias Hello.Rentals
  alias Hello.Rentals.Rental

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:rental) do
    {:ok, rental} = Rentals.create_rental(@create_attrs)
    rental
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all rentals", %{conn: conn} do
      conn = get(conn, Routes.rental_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create rental" do
    test "renders rental when data is valid", %{conn: conn} do
      conn = post(conn, Routes.rental_path(conn, :create), rental: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.rental_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.rental_path(conn, :create), rental: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update rental" do
    setup [:create_rental]

    test "renders rental when data is valid", %{conn: conn, rental: %Rental{id: id} = rental} do
      conn = put(conn, Routes.rental_path(conn, :update, rental), rental: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.rental_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, rental: rental} do
      conn = put(conn, Routes.rental_path(conn, :update, rental), rental: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete rental" do
    setup [:create_rental]

    test "deletes chosen rental", %{conn: conn, rental: rental} do
      conn = delete(conn, Routes.rental_path(conn, :delete, rental))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.rental_path(conn, :show, rental))
      end
    end
  end

  defp create_rental(_) do
    rental = fixture(:rental)
    %{rental: rental}
  end
end
