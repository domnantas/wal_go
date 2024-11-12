defmodule WalGoWeb.UserLoginLive do
  use WalGoWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm my-20">
      <.card>
        <.card_header>
          <.card_title>Log in</.card_title>
          <.card_description>Enter your email below to log in to your account</.card_description>
        </.card_header>
        <.card_content>
          <.form for={@form} id="login_form" action={~p"/users/log_in"} phx-change="validate">
            <div class="space-y-8">
              <.input field={@form[:email]} type="text" label="Email" />
              <.input field={@form[:password]} type="password" label="Password" />
              <div>
                <.input field={@form[:remember_me]} type="checkbox" label="Keep me logged in" />
                <.link navigate={~p"/users/reset_password"} class="text-sm font-semibold">
                  Forgot your password?
                </.link>
              </div>
              <div>
                <.button phx-disable-with="Logging in..." class="w-full">
                  Log in <span aria-hidden="true">→</span>
                </.button>
              </div>
            </div>
          </.form>
        </.card_content>
      </.card>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    email = Phoenix.Flash.get(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form), temporary_assigns: [form: form]}
  end
end
