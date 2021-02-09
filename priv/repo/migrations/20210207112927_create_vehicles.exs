defmodule Hello.Repo.Migrations.CreateVehicles do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :name, :string
      add :speed, :float
      add :days, :map , default: %{:sat => 1 }
      add :user_id, references(:users)
      timestamps()
    end

  end
end
