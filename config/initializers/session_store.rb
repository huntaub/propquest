# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_propquest_session',
  :secret      => '451cf5822b357eb17bd846180440be7802488bd501cce9a8992093ec0aa00940944e41614eec97c7c6fdfe764373e9bd3ef39f9dd7a845bc5faf9667fc02f536'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
