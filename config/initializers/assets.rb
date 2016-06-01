# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( jquery.js )
Rails.application.config.assets.precompile += %w( jquery-1.4.4.min.js )
Rails.application.config.assets.precompile += %w( foundation.min.js )
Rails.application.config.assets.precompile += %w( jquery.reveal.js )
Rails.application.config.assets.precompile += %w( jquery.raty.js )
Rails.application.config.assets.precompile += %w( ratyrate.js.erb )
Rails.application.config.assets.precompile += %w( chosen-jquery.js )
Rails.application.config.assets.precompile += %w( foundation.js )
Rails.application.config.assets.precompile += %w( bodyscript.js )
Rails.application.config.assets.precompile += %w( map.js )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
