OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Figaro.env.github_client, Figaro.env.github_secret, scope: "user"
end

Hashie.logger = Logger.new(nil)
