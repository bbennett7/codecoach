opts = { scope: 'user:email' }

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, domain: 'https://code-coach-app.herokuapp.com/', ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], opts
  #provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
end
