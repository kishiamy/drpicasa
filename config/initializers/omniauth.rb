Rails.application.config.middleware.use OmniAuth::Builder do
   provider :google_oauth2,ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {access_type: 'online', approval_prompt: '', :scope => 'http://picasaweb.google.com/data/', :redirect_uri => 'http://drpicasa.herokuapp.com/auth/google_oauth2/callback'}
end
