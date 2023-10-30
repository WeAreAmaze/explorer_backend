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
end
