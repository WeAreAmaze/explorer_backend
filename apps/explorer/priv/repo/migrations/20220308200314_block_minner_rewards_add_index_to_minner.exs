defmodule Explorer.Repo.Migrations.AddUniqueIndexToMinner do
  use Ecto.Migration

  def change do
    create(
      unique_index(
        :block_minner_rewards,
        [:address, :block_hash]
      )
    )
  end
end
