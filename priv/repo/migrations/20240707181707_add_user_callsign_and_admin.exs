defmodule WalGo.Repo.Migrations.AddUserCallsignAndAdmin do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :callsign, :string, null: false
      add :admin, :boolean, default: false
    end

    create unique_index(:users, [:callsign])
  end
end
