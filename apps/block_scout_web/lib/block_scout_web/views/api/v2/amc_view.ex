defmodule BlockScoutWeb.API.V2.AmcView do
  use BlockScoutWeb, :view

  @spec render(String.t(), map()) :: map()
  def render("verifiers.json", %{verifiers: verifiers, next_page_params: next_page_params}) do
    %{
      items:
        Enum.map(verifiers, fn verify ->
          %{
            "address_hash" => verify.address_hash,
            "public_key" => verify.public_key,
          }
        end),
      next_page_params: next_page_params
    }
  end

  @spec render(String.t(), map()) :: map()
  def render("address_verify_list.json", %{verifiers: verifiers, next_page_params: next_page_params}) do
    %{
      items:
        Enum.map(verifiers, fn verify ->
           %{
             "block_timestamp" => verify.block_timestamp,
             "block_number"  => verify.block_number
           }
        end),
      next_page_params: next_page_params
    }
  end


  @spec render(String.t(), map()) :: map()
  def render("rewards.json", %{rewards: rewards, next_page_params: next_page_params}) do
    %{
      items:
        Enum.map(rewards, fn reward ->
           %{
             "address_hash" => reward.address_hash,
             "amount" => reward.amount,
           }
        end),
      next_page_params: next_page_params
    }
  end

  @spec render(String.t(), map()) :: map()
  def render("address_rewards_list.json", %{rewards: rewards, next_page_params: next_page_params}) do
    %{
      items:
        Enum.map(rewards, fn reward ->
           %{
             "block_timestamp" => reward.block_timestamp,
             "block_number"  => reward.block_number,
             "amount" => reward.amount,
           }
        end),
      next_page_params: next_page_params
    }
  end

end
