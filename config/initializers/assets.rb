%w( admin application events home industry listings panel posts footerlinks ).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js.coffee", "#{controller}.css"]
end