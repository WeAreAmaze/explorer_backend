defmodule Explorer.Chain.Block.Verifier do
  @moduledoc """
  Represents the total reward given to an address in a block.
  """

  use Explorer.Schema

  alias Explorer.Chain.Block.Verifier
  alias Explorer.Chain.{Block, Hash}
  import Ecto.Query, only: [from: 2, preload: 3, subquery: 1, where: 3]

  @required_attrs ~w(address block_hash public_key)a

  @typedoc """
  The static block given to the miner of a verifiers.

  * `:address` - block address
  * `:public_key` - key hash
  """

  @type t :: %Verifier{
          address: String.t() | nil,
          block: %Ecto.Association.NotLoaded{} | Block.t() | nil,
          block_hash: Hash.Full.t() | nil,
          public_key: String.t() | nil,
        }

  @primary_key false
  schema "block_verifiers_rewards" do
    field(:address,:string)
    field(:public_key, :string)
    belongs_to(
      :block,
      Block,
      foreign_key: :block_hash,
      references: :hash,
      type: Hash.Full
    )
    timestamps()
  end

  def changeset(%Verifier{} = block_verifiers_rewards, attrs) do
    block_verifiers_rewards
    |> cast(attrs, @required_attrs)
    |> validate_required([@required_attrs])
  end
end
