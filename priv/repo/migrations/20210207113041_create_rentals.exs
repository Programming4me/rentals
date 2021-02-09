defmodule Hello.Repo.Migrations.CreateRentals do
  use Ecto.Migration

  def change do
    create table(:rentals) do
      add :price ,:int
      add :start_time, :date , default: fragment("now()")
      add :end_time , :date , default: fragment("now()")
      add :user_id, references(:users)
      add :vehicle_id, references(:vehicles)
      timestamps()
    end

  end
end
