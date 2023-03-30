defmodule Explorer.Repo.Migrations.CreateNewBlockMinnerRewardsAddPrimary do
  use Ecto.Migration

  def change do
    drop(
      unique_index(
        :block_minner_rewards,
        ~w(address block_hash)a
      )
    )

    alter table(:block_minner_rewards) do
      modify(:address, :string, null: false, primary_key: true)
      modify(:block_hash, :bytea, null: false, primary_key: true)
    end
  end
end
