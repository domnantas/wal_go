defmodule WalGo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      WalGoWeb.Telemetry,
      WalGo.Repo,
      {DNSCluster, query: Application.get_env(:wal_go, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: WalGo.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: WalGo.Finch},
      # Start a worker by calling: WalGo.Worker.start_link(arg)
      # {WalGo.Worker, arg},
      # Start to serve requests, typically the last entry
      WalGoWeb.Endpoint,
      Turboprop.Cache
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WalGo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WalGoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
