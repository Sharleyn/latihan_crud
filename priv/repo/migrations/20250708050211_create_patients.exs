defmodule LatihanCrud.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :nama, :string
      add :alamat, :string
      add :tarikh, :date
      add :umur, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
