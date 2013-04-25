Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, CLIENT_ID = '947033028852.apps.googleusercontent.com', CLIENT_SECRET = 'Czqi1f9U61n19KjJ9OwDyYAc', 
  { :scope => "userinfo.email,userinfo.profile,https://picasaweb.google.com/data/",
    :access_type => 'online', 
    :approval_prompt => 'auto'
  }
end

