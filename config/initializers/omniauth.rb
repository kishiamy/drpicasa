Rails.application.config.middleware.use OmniAuth::Builder do
   provider :google_oauth2, '1002583254671.apps.googleusercontent.com', 'ueU7Un8nTThg-rvDSQe5IEXc', :scope => "https://picasaweb.google.com/data/"
end
