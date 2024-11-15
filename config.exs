
import Config

config :pleroma, Pleroma.Web.Endpoint,
   url: [host: "exmple.com", scheme: "https", port: 443],
   http: [ip: {127, 0, 0, 1}, port: 4000],
   secret_key_base: "O9BsYZFyiaCnrYYx2oKXAowQYgb5M1PdMPSv2aUNOsD2OAsNZeaGNBABPJDZf/cS",
   live_view: [signing_salt: "I7XnS0ks"],
   signing_salt: "JegReJ9B"

config :pleroma, :instance,
  name: "exmple.com",
  email: "g200@mail.com",
  notify_email: "g200@mail.com",
  limit: 5000,
  registrations_open: true

config :pleroma, :media_proxy,
  enabled: false,
  redirect_on_failure: true
  #base_url: "https://cache.pleroma.social"

config :pleroma, Pleroma.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "pleroma",
  password: "eh+UI6I6hlf60DBnr/ST2i8wd1ZwffcWeJv/8hUkaVk0IZUvix56OX8gca6demPJ",
  database: "pleroma",
  hostname: "localhost"

# Configure web push notifications
config :web_push_encryption, :vapid_details,
  subject: "mailto:g200@mail.com",
  public_key: "BBVWcQlooCsZlE5MnQGnvArBB0DJhb8qS-We3nWbuVmsAeWbzuF_-s6YYB9Hd_0W5qcGfdr-MofhX3itKMF5cSw",
  private_key: "BoaVS0aH0T4roOdwL2Qq8jwyKcV9FiQ1XwPBvbxfwJM"

config :pleroma, :database, rum_enabled: false
config :pleroma, :instance, static_dir: "/var/lib/pleroma/static"
config :pleroma, Pleroma.Uploaders.Local, uploads: "/var/lib/pleroma/uploads"

config :joken, default_signer: "mUUkrSL2DLh2BRqQ3CTDbnsVfYMXQim9UWyc8Kx3q2w4GNvXJKjlLB2hqCRob7qH"

config :pleroma, configurable_from_database: true

config :pleroma, Pleroma.Upload, filters: [Pleroma.Upload.Filter.Exiftool.StripLocation, Pleroma.Upload.Filter.Exiftool.ReadDescription]