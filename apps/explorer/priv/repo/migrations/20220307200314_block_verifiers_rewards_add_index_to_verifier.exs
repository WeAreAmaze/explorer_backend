defmodule Explorer.Repo.Migrations.AddUniqueIndexToVerifier do
  use Ecto.Migration

  def change do
    create(
      unique_index(
        :block_verifiers_rewards,
        [:address_hash, :block_hash]
      )
    )
  end
end
