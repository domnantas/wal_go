# WalGo

Interactive amateur radio (Worked All Lithuania)](https://www.qrz.lt/wal/) map with Capture The Flag elements

## Local development

```sh
# Start the database
docker-compose up -d

# Install Elixir dependencies, run migrations, seed the database, and install npm dependencies
mix setup

# Launch the Phoenix server
mix phx.server
# or
iex -S mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Learn more about Phoenix

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
