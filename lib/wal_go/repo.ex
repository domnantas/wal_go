defmodule WalGo.Repo do
  use Ecto.Repo,
    otp_app: :wal_go,
    adapter: Ecto.Adapters.Postgres
end
