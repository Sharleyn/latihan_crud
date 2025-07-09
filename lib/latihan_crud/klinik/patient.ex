defmodule LatihanCrud.Klinik.Patient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "patients" do
    field :nama, :string
    field :alamat, :string
    field :tarikh, :date
    field :umur, :integer
    field :nota, :string
    field :review, :date

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [:nama, :alamat, :tarikh, :umur, :nota, :review])
    |> validate_required([:nama, :alamat, :tarikh, :umur])
  end
end
