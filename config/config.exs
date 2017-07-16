# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :logger,
  level: :info

case Mix.env do
  :test ->
    config :facebook_messenger,
      facebook_page_token: System.get_env("PAGE_TOKEN") || "PAGE_TOKEN",
      challenge_verification_token: System.get_env("VERIFY_TOKEN") || "VERIFY_TOKEN",
      endpoint: "/messenger/webhook",
      request_manager: FacebookMessenger.RequestManager.Mock,
      responder: FacebookMessenger.Responder.Mock

  :dev ->
    config :facebook_messenger,
      facebook_page_token: System.get_env("PAGE_TOKEN") || "PAGE_TOKEN",
      challenge_verification_token: System.get_env("VERIFY_TOKEN") || "VERIFY_TOKEN",
      endpoint: "/messenger/webhook",
      request_manager: FacebookMessenger.RequestManager,
      responder: FacebookMessenger.Responder

  _ -> true
end
