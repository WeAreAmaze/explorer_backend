defmodule Explorer.Repo.Migrations.AddUniqueIndexToVerifier do
  use Ecto.Migration

  def change do
    create(
      unique_index(
        :block_verifiers_rewards,
        [:address, :block_hash]
      )
    )
  end
end
