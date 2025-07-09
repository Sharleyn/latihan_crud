defmodule LatihanCrud.KlinikTest do
  use LatihanCrud.DataCase

  alias LatihanCrud.Klinik

  describe "patients" do
    alias LatihanCrud.Klinik.Patient

    import LatihanCrud.KlinikFixtures

    @invalid_attrs %{nama: nil, alamat: nil, tarikh: nil, umur: nil}

    test "list_patients/0 returns all patients" do
      patient = patient_fixture()
      assert Klinik.list_patients() == [patient]
    end

    test "get_patient!/1 returns the patient with given id" do
      patient = patient_fixture()
      assert Klinik.get_patient!(patient.id) == patient
    end

    test "create_patient/1 with valid data creates a patient" do
      valid_attrs = %{nama: "some nama", alamat: "some alamat", tarikh: ~D[2025-07-07], umur: 42}

      assert {:ok, %Patient{} = patient} = Klinik.create_patient(valid_attrs)
      assert patient.nama == "some nama"
      assert patient.alamat == "some alamat"
      assert patient.tarikh == ~D[2025-07-07]
      assert patient.umur == 42
    end

    test "create_patient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Klinik.create_patient(@invalid_attrs)
    end

    test "update_patient/2 with valid data updates the patient" do
      patient = patient_fixture()
      update_attrs = %{nama: "some updated nama", alamat: "some updated alamat", tarikh: ~D[2025-07-08], umur: 43}

      assert {:ok, %Patient{} = patient} = Klinik.update_patient(patient, update_attrs)
      assert patient.nama == "some updated nama"
      assert patient.alamat == "some updated alamat"
      assert patient.tarikh == ~D[2025-07-08]
      assert patient.umur == 43
    end

    test "update_patient/2 with invalid data returns error changeset" do
      patient = patient_fixture()
      assert {:error, %Ecto.Changeset{}} = Klinik.update_patient(patient, @invalid_attrs)
      assert patient == Klinik.get_patient!(patient.id)
    end

    test "delete_patient/1 deletes the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{}} = Klinik.delete_patient(patient)
      assert_raise Ecto.NoResultsError, fn -> Klinik.get_patient!(patient.id) end
    end

    test "change_patient/1 returns a patient changeset" do
      patient = patient_fixture()
      assert %Ecto.Changeset{} = Klinik.change_patient(patient)
    end
  end
end
