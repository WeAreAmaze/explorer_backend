defmodule Explorer.Chain.Block.MinnerReward do
  @moduledoc """
  Represents the total reward given to an address in a block.
  """

  use Explorer.Schema

  alias Explorer.Chain.Wei
  alias Explorer.Chain.{Address, Block, Hash}

  @required_attrs ~w(address block_hash amount)a

  @typedoc """
  The static block given to the miner of a verifiers.

  * `:address` - block address
  * `:public_key` - key hash
  """
  @type t :: %__MODULE__{
          # address_hash: %Ecto.Association.NotLoaded{} | Address.t() | nil,
          # address: Hash.Address.t(),
          address: String.t() | nil,
          block: %Ecto.Association.NotLoaded{} | Block.t() | nil,
          block_hash: Block.hash(),
          amount: Wei.t()
        }

  @primary_key false
  schema "block_minner_rewards" do
    field(:address,:string)
    # belongs_to(
    #   :address_hash,
    #   Address,
    #   foreign_key: :address,
    #   references: :hash,
    #   type: Hash.Address
    # )
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

  def changeset(%__MODULE__{} = minner_rewards, attrs) do
    minner_rewards
    |> cast(attrs, [:address, :block_hash, :amount])
    |> validate_required([:address, :block_hash, :amount])
  end
end
