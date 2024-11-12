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
          "phx-submit-loading:opacity-75 rounded bg-slate-900 hover:bg-slate-700 py-2 px-4 text-sm font-semibold leading-5 text-white active:text-white/80 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-slate-900 focus-visible:ring-offset-1",
          @class
        ])
      }
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  attr :class, :string, default: nil
  slot :inner_block, required: true

  def card(assigns) do
    ~H"""
    <div class={merge(["rounded-lg border bg-card text-slate-900 shadow-sm", @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :class, :string, default: nil
  slot :inner_block, required: true

  def card_header(assigns) do
    ~H"""
    <div class={merge(["flex flex-col gap-y-1.5 p-6", @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :class, :string, default: nil
  slot :inner_block, required: true

  def card_title(assigns) do
    ~H"""
    <h3 class={merge(["text-2xl font-semibold leading-none tracking-tight", @class])}>
      <%= render_slot(@inner_block) %>
    </h3>
    """
  end

  attr :class, :string, default: nil
  slot :inner_block, required: true

  def card_description(assigns) do
    ~H"""
    <p class={merge(["text-sm text-slate-500", @class])}>
      <%= render_slot(@inner_block) %>
    </p>
    """
  end

  attr :class, :string, default: nil
  slot :inner_block, required: true

  def card_content(assigns) do
    ~H"""
    <div class={merge(["p-6 pt-0", @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :class, :string, default: nil
  slot :inner_block, required: true

  def card_footer(assigns) do
    ~H"""
    <div class={merge(["flex items-center p-6 pt-0", @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
