# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w(stockcontroller.scss)
Rails.application.config.assets.precompile += %w(sessions.scss)
Rails.application.config.assets.precompile += %w(register.scss)
Rails.application.config.assets.precompile += %w(css/linearicons.css)
Rails.application.config.assets.precompile += %w(css/animate.min.css)
Rails.application.config.assets.precompile += %w(css/font-awesome.min.css)
Rails.application.config.assets.precompile += %w(css/magnific-popup.css)
Rails.application.config.assets.precompile += %w(css/nice-select.css)
Rails.application.config.assets.precompile += %w(css/owl.carousel.css)
Rails.application.config.assets.precompile += %w(css/bootstrap.css)
Rails.application.config.assets.precompile += %w(css/main.css)
Rails.application.config.assets.precompile += %w(css/self.css)
Rails.application.config.assets.precompile += %w(css/zhenduan.css)

Rails.application.config.assets.precompile += %w(js/vendor/jquery-2.2.4.min.js)
Rails.application.config.assets.precompile += %w(js/vendor/bootstrap.min.js)
Rails.application.config.assets.precompile += %w(js/easing.min.js)
Rails.application.config.assets.precompile += %w(js/hoverIntent.js)
Rails.application.config.assets.precompile += %w(js/superfish.min.js)
Rails.application.config.assets.precompile += %w(js/jquery.ajaxchimp.min.js)
Rails.application.config.assets.precompile += %w(js/jquery.magnific-popup.min.js)
Rails.application.config.assets.precompile += %w(js/owl.carousel.min.js)
Rails.application.config.assets.precompile += %w(js/owl-carousel-thumb.min.js)
Rails.application.config.assets.precompile += %w(js/jquery.sticky.js)
Rails.application.config.assets.precompile += %w(js/jquery.nice-select.min.js)
Rails.application.config.assets.precompile += %w(js/parallax.min.js)
Rails.application.config.assets.precompile += %w(js/waypoints.min.js)
Rails.application.config.assets.precompile += %w(js/wow.min.js)
Rails.application.config.assets.precompile += %w(js/jquery.counterup.min.js)
Rails.application.config.assets.precompile += %w(js/mail-script.js)
Rails.application.config.assets.precompile += %w(js/main.js)
Rails.application.config.assets.precompile += %w(js/jquery-1.8.3.min.js)
Rails.application.config.assets.precompile += %w(js/highcharts.js)
Rails.application.config.assets.precompile += %w(js/exporting.js)
Rails.application.config.assets.precompile += %w(js/oldie.js)
Rails.application.config.assets.precompile += %w(js/highcharts-zh_CN.js)
Rails.application.config.assets.precompile += %w(js/highcharts-more.js)
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
