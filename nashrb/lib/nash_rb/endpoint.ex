defmodule NashRb.Endpoint do
  use Phoenix.Endpoint, otp_app: :nash_rb

  plug Plug.Static,
    at: "/", from: :nash_rb

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_nash_rb_key",
    signing_salt: "r3sAngM5",
    encryption_salt: "98h64ftz"

  plug :router, NashRb.Router
end
