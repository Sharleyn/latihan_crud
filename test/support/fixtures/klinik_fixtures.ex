defmodule LatihanCrud.KlinikFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LatihanCrud.Klinik` context.
  """

  @doc """
  Generate a patient.
  """
  def patient_fixture(attrs \\ %{}) do
    {:ok, patient} =
      attrs
      |> Enum.into(%{
        alamat: "some alamat",
        nama: "some nama",
        tarikh: ~D[2025-07-07],
        umur: 42
      })
      |> LatihanCrud.Klinik.create_patient()

    patient
  end
end
