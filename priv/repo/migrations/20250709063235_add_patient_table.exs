defmodule LatihanCrud.Repo.Migrations.AddPatientTable do
  use Ecto.Migration

  def change do
    alter table(:patients) do
    add :nota, :string
    add :review, :date
    end
  end
end
