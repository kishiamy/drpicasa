Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['947033028852.apps.googleusercontent.com'], ENV['Czqi1f9U61n19KjJ9OwDyYAc'], 
  { :scope => "userinfo.email,userinfo.profile,https://picasaweb.google.com/data/",
    :access_type => 'online', 
    :approval_prompt => 'auto'
  }
  # redirect_uri = https://localhost:3000/oauth2callback
end

