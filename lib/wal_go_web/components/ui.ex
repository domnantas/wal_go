defmodule WalGoWeb.UI do
  import Turboprop.Merge
  use Phoenix.Component

  attr :class, :string, default: nil
  attr :rest, :global, include: ~w(type disabled form name value)

  slot :inner_block, required: true

  def button(assigns) do
    ~H"""
    <button
      class={
        merge([
          "phx-submit-loading:opacity-75 rounded bg-zinc-900 hover:bg-zinc-700 py-2 px-4 text-sm font-semibold leading-5 text-white active:text-white/80 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-zinc-900 focus-visible:ring-offset-1",
          @class
        ])
      }
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end
end
