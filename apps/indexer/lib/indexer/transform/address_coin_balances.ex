defmodule Indexer.Transform.AddressCoinBalances do
  @moduledoc """
  Extracts `Explorer.Chain.Address.CoinBalance` params from other schema's params.
  """

  require Logger

  import EthereumJSONRPC,
    only: [integer_to_quantity: 1, json_rpc: 2, quantity_to_integer: 1, request: 1]

  def params_set(%{} = import_options) do
    Enum.reduce(import_options, MapSet.new(), &reducer/2)
  end

  defp reducer({:beneficiary_params, beneficiary_params}, acc) when is_list(beneficiary_params) do
    Enum.into(beneficiary_params, acc, fn %{
                                            address_hash: address_hash,
                                            block_number: block_number
                                          }
                                          when is_binary(address_hash) and
                                                 is_integer(block_number) ->
      %{address_hash: address_hash, block_number: block_number}
    end)
  end

  defp reducer({:blocks_params, blocks_params}, acc) when is_list(blocks_params) do
    # a block MUST have a miner_hash and number
    Enum.into(blocks_params, acc, fn %{miner_hash: address_hash, number: block_number}
                                     when is_binary(address_hash) and is_integer(block_number) ->
      %{address_hash: address_hash, block_number: block_number}
    end)
  end

  defp reducer({:blocks_params1, blocks_params1}, acc) when is_list(blocks_params1) do
    # a block MUST have a hash and number

    # Enum.reduce(blocks_params1, acc, &verifiers__params_reducer/2)

    blocks_params1
    |> Enum.into(acc, fn
      %{hash: block_hash, number: block_number}
      when is_binary(block_hash) and is_integer(block_number) ->
        %{block_hash: block_hash, block_number: block_number}

        MapSet.put(acc, %{block_hash: block_hash, block_number: block_number})
        # verifier = %MapSet{
        #   %{address: "0xb9e94477f5f88b5e8da2e97e8506d6e4fcf04e5b", public_key: "0xb77416a68f2d254950dd25a1dcc65e3c75f3c5f9579279615fa8576e47ab9b50501fcb53b1e37518ab974fc3afa171ad"},
        #   %{address: "0x7331a3c43fe352eb7c990831ca55a77124a24e53", public_key: "0xa0aebfded12083cdc3eda62bad5dbc675e116d5e70c32e1be58a451023190230b2cdd936f79d83b89ce835c1b9779763"},
        #   %{address: "0x0456f2b965fdad3818ba2c489b9dadf1a37ce5fb", public_key: "0x90936b690b60fd354ae8b5b18f8c79e72cb03d01bcb2bc3c584433472e443cc78462824d533d4c2fdc1da1200b5d1686"}
        # }
        # blocklist = %MapSet{ %{block_hash: "0x64e9cdf1a4e2c7faf7506330c1722bfe5cf68cc8a0a1bbee0646dfe573414330", block_number: 100878} }

        # Enum.each(blocklist, fn {_, block} ->
        #   verifier = MapSet.put(verifier, block.block_hash)
        # end)

        #     Enum.map(blocks_params1, fn item ->
        #  end)
    end)

    # Enum.each(blocks_params1, fn acc1 ->
    #   {
    #     MapSet.put(blocks_params1, %{block_hash: acc1.block_hash, block_number: acc1.block_number})
    #   }
    # end)

    # |> Enum.reject(fn val -> is_nil(val) end)
    # |> MapSet.new()

    # blocks_params1
    # |> Enum.into(acc, fn
    #   %{hash: block_hash, number: block_number}
    #   when is_binary(block_hash) and is_integer(block_number) ->
    #     MapSet.put(acc, %{block_hash: block_hash, block_number: block_number})
    # end)
  end

  defp reducer({:verifiers_params, verifiers_params}, initial) when is_list(verifiers_params) do
    # Logger.info("-----initial--#{inspect(initial)}-----")
    #  Enum.reduce(verifiers_params, initial, &verifiers__params_reducer/2)

    Enum.into(verifiers_params, initial, fn %{address: address, public_key: public_key}
                                            when is_binary(address) and is_binary(public_key) ->
      %{address: address, public_key: public_key}
      # MapSet.put(initial, %{address: address,public_key: public_key})
    end)

    #   verifiers_params
    #     |> Enum.into(initial, fn
    #       %{address: address, public_key: public_key}
    #       when is_binary(address) and is_binary(public_key) ->
    #         MapSet.put(initial,%{address: address, public_key: public_key});
    # end)
    # initial
    #   |> Enum.into(verifiers_params, fn
    #     %{address: address, public_key: public_key}
    #     when is_binary(address) and is_binary(public_key) ->
    #       MapSet.put(verifiers_params,%{block_hash: block_hash,block_number: block_number}
    #       #MapSet.put(verifiers_params,%{address: address, public_key: public_key});

    # %{address: address, public_key: public_key}

    # %{type: "pending"} ->
    #   nil
    # end)
    # |> Enum.reject(fn val -> is_nil(val) end)
    # |> MapSet.new()
  end

  defp reducer({:internal_transactions_params, internal_transactions_params}, initial)
       when is_list(internal_transactions_params) do
    Enum.reduce(internal_transactions_params, initial, &internal_transactions_params_reducer/2)
  end

  defp reducer({:logs_params, logs_params}, acc) when is_list(logs_params) do
    # a log MUST have address_hash and block_number
    logs_params
    |> Enum.into(acc, fn
      %{address_hash: address_hash, block_number: block_number}
      when is_binary(address_hash) and is_integer(block_number) ->
        %{address_hash: address_hash, block_number: block_number}

      %{type: "pending"} ->
        nil
    end)
    |> Enum.reject(fn val -> is_nil(val) end)
    |> MapSet.new()
  end

  defp reducer({:transactions_params, transactions_params}, initial)
       when is_list(transactions_params) do
    Enum.reduce(transactions_params, initial, &transactions_params_reducer/2)
  end

  defp reducer(
         {:block_second_degree_relations_params, block_second_degree_relations_params},
         initial
       )
       when is_list(block_second_degree_relations_params),
       do: initial

  defp internal_transactions_params_reducer(
         %{block_number: block_number} = internal_transaction_params,
         acc
       )
       when is_integer(block_number) do
    case internal_transaction_params do
      %{type: "call"} ->
        acc

      %{type: "create", error: _} ->
        acc

      %{type: "create", created_contract_address_hash: address_hash}
      when is_binary(address_hash) ->
        MapSet.put(acc, %{address_hash: address_hash, block_number: block_number})

      %{
        type: "selfdestruct",
        from_address_hash: from_address_hash,
        to_address_hash: to_address_hash
      }
      when is_binary(from_address_hash) and is_binary(to_address_hash) ->
        acc
        |> MapSet.put(%{address_hash: from_address_hash, block_number: block_number})
        |> MapSet.put(%{address_hash: to_address_hash, block_number: block_number})
    end
  end

  defp transactions_params_reducer(
         %{block_number: block_number, from_address_hash: from_address_hash} = transaction_params,
         initial
       )
       when is_integer(block_number) and is_binary(from_address_hash) do
    # a transaction MUST have a `from_address_hash`
    acc = MapSet.put(initial, %{address_hash: from_address_hash, block_number: block_number})

    # `to_address_hash` is optional
    case transaction_params do
      %{to_address_hash: to_address_hash} when is_binary(to_address_hash) ->
        MapSet.put(acc, %{address_hash: to_address_hash, block_number: block_number})

      _ ->
        acc
    end
  end

  defp verifiers__params_reducer(%{number: block_number, hash: block_hash}, initial)
       when is_integer(block_number) and is_binary(block_hash) do
    Logger.info("------2222----#{inspect(initial)}")

    verifiers__params =
      Enum.map(initial, fn item ->
        MapSet.put(item, %{block_hash: block_hash, block_number: block_number})
      end)

    # blocks_params1
    # |> Enum.reduce(acc, fn
    #   %{hash: block_hash, number: block_number}
    #      when is_binary(block_hash) and is_integer(block_number) ->
    #   # Enum.map(acc, fn item ->
    #     MapSet.put(acc, %{block_hash: block_hash,block_number: block_number})
    #   # end)
    # end)

    # acc = MapSet.put(initial, %{address_hash: from_address_hash, block_number: block_number})

    # verifiers_params
    # |> Enum.into(initial, fn
    #   %{block_hash: block_hash, block_number: block_number}
    #   when is_binary(block_hash) and is_integer(block_number) ->
    #     %{block_hash: block_hash, block_number: block_number}

    #   # %{type: "pending"} ->
    #   #   nil
    # end)
    # |> Enum.reject(fn val -> is_nil(val) end)
    # |> MapSet.new()

    # verifier_map = MapSet.new(initial)
    # # Logger.info("-----verifier_mapverifier_mapverifier_map--#{inspect(verifier_map)}-----")

    # Enum.each(verifiers_params, fn va ->
    #   MapSet.put(verifier_map, %{address: va.address, public_key: va.public_key})
    # end)

    # Enum.each(initial, fn va ->
    #   MapSet.put(verifier_map, %{block_hash: va.block_hash})
    # end)
    # |> Enum.reject(fn val -> is_nil(val) end)
    # |> MapSet.new()
  end
end
