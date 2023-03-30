defmodule Explorer.Repo.Migrations.AddUniqueIndexDropToVerifier do
  use Ecto.Migration

  def change do
    drop_if_exists(
      index(:block_verifiers_rewards, [:address_hash, :block_hash],
        name: "block_verifiers_rewards_address_hash_block_hash_index"
      )
    )
  end
end
