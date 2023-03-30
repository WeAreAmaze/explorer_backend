defmodule Explorer.Repo.Migrations.CreateNewBlockMinnerRewards do
  use Ecto.Migration

  def change do
    create table(:block_minner_rewards, primary_key: false) do
      # addresses for hash
      #add(:address, references(:addresses, column: :hash, on_delete: :delete_all, type: :bytea), null: false)
      add(:address, :string, null: false)
      add(:block_hash, references(:blocks, column: :hash, on_delete: :delete_all, type: :bytea), null: false)
      add(:amount, :numeric, precision: 100, null: true)
      timestamps(null: false, type: :utc_datetime)
    end
    create(unique_index(:block_minner_rewards, [:address, :block_hash]))
  end
end
