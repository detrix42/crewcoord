# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
Rails.application.config.assets.paths << 'app/assets/styles'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( .css )

Rails.application.config.assets.precompile += %w( home.css )
Rails.application.config.assets.precompile += %w( jquery.min.js,
jquery_ujs.min.js, company_signup.js )
