Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['348464901716.apps.googleusercontent.com'], ENV['UBnaijhE39wJqVEIeTa4PC7h'], 
  { :scope => "userinfo.email,userinfo.profile,https://picasaweb.google.com/data/",
    :access_type => 'online', 
    :approval_prompt => 'auto'
  }
  # redirect_uri = https://localhost:3000/oauth2callback
end
