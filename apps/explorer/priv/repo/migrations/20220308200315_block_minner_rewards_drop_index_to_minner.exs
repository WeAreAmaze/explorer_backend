defmodule Explorer.Repo.Migrations.AddUniqueIndexDropToMinner do
  use Ecto.Migration

  def change do
    drop_if_exists(
      index(:block_minner_rewards, [:address, :block_hash],
        name: "block_minner_rewards_address_block_hash_index"
      )
    )
  end
end
