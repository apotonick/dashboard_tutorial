# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_apotomo_examples_session',
  :secret      => '905dfb30046e67e9cd8c1296deef5f5d512e81c4ec0796507b429d63a1a954e99eb978274f8e6866d3d4f50d1476dcb305c2f4249a704a96c4be9427387cd192'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
