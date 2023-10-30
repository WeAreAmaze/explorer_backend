defmodule BlockScoutWeb.API.V2.AmcController do
  use BlockScoutWeb, :controller

  import BlockScoutWeb.Chain,
         only: [
           next_page_params: 3,
           paging_options: 1,
           split_list_by_page: 1,
           parse_block_hash_or_number_param: 1,
           put_key_value_to_paging_options: 3
         ]

#  import BlockScoutWeb.Chain,
#         only: [
#           hash_to_block: 2,
#           number_to_block: 2,
#           string_to_block_hash: 1
#         ]

  import BlockScoutWeb.PagingHelper, only: [delete_parameters_from_next_page_params: 1]
#
#  alias BlockScoutWeb.API.V2.AmcView
  alias Explorer.Chain

  @api_true [api?: true]

  @block_params [
    necessity_by_association: %{
      [miner: :names] => :optional,
      :block_verifiers_rewards => :optional
    },
    api?: true
  ]

  action_fallback(BlockScoutWeb.API.V2.FallbackController)

  @spec verifiers(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def verifiers(conn, %{"block_hash_or_number" => block_hash_or_number} = params) do
    with {:ok, type, value} <- parse_block_hash_or_number_param(block_hash_or_number),
         {:ok, block} <- fetch_block(type, value, @api_true)do

      full_options =
        @block_params
        |> Keyword.merge(put_key_value_to_paging_options(paging_options(params), :is_index_in_asc_order, true))
        |> Keyword.merge(@api_true)

      verifier_plus_one = Chain.block_to_verifiers(block.hash, full_options)

      {verifiers, next_page} = split_list_by_page(verifier_plus_one)

      next_page_params =
        next_page
        |> next_page_params(verifiers, delete_parameters_from_next_page_params(params))

      conn
      |> put_status(200)
#      |> put_view(AmcView)
      |> render(:verifiers, %{verifiers: verifiers, next_page_params: next_page_params})
    end
  end

  defp fetch_block(:hash, hash, params) do
    Chain.hash_to_block(hash, params)
  end

  defp fetch_block(:number, number, params) do
    case Chain.number_to_block(number, params) do
      {:ok, _block} = ok_response ->
        ok_response

      _ ->
        {:lost_consensus, Chain.nonconsensus_block_by_number(number, @api_true)}
    end
  end
end