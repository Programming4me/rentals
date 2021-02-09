defmodule Hello.Rentals.Rental do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rentals" do

    timestamps()
  end

  @doc false
  def changeset(rental, attrs) do
    rental
    |> cast(attrs, [])
    |> validate_required([])
  end
end
