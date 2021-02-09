defmodule HelloWeb.RentalView do
  use HelloWeb, :view
  alias HelloWeb.RentalView

  def render("index.json", %{rentals: rentals}) do
    %{data: render_many(rentals, RentalView, "rental.json")}
  end

  def render("show.json", %{rental: rental}) do
    %{data: render_one(rental, RentalView, "rental.json")}
  end

  def render("rental.json", %{rental: rental}) do
    %{id: rental.id}
  end
end
