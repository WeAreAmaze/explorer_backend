defmodule Explorer.Repo.Migrations.AddUniqueIndexDropToVerifier do
  use Ecto.Migration

  def change do
    drop_if_exists(
      index(:block_verifiers_rewards, [:address, :block_hash],
        name: "block_verifiers_rewards_address_block_hash_index"
      )
    )
  end
end
