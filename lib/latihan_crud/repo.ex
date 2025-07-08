defmodule LatihanCrud.Repo do
  use Ecto.Repo,
    otp_app: :latihan_crud,
    adapter: Ecto.Adapters.Postgres
end
