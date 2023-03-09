defmodule Explorer.Chain.Block.MinerReward do
  @moduledoc """
  Represents the total reward given to an address in a block.
  """

  use Explorer.Schema

  alias Explorer.Chain.Block.MinerReward
  alias Explorer.Chain.{Block, Hash}
  alias Explorer.Chain.Wei

  @required_attrs ~w(address block_hash amount)a

  @typedoc """
  The static block given to the miner of a verifiers.

  * `:address` - block address
  * `:public_key` - key hash
  """
  @type t :: %MinerReward{
          address: String.t() | nil,
          block_hash: Hash.Full.t(),
          amount: Wei.t()
        }

  @primary_key false
  schema "block_minner_rewards" do
    field(:address,:string)
    field(:amount, Wei)
    belongs_to(
      :block,
      Block,
      foreign_key: :block_hash,
      references: :hash,
      type: Hash.Full
    )
    timestamps()
  end

  def changeset(%MinerReward{} = block_minner_rewards, attrs) do
    block_minner_rewards
    |> cast(attrs, @required_attrs)
    |> validate_required([@required_attrs])
  end
end
