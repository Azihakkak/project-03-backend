if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_GlamB', domain: 'https://glam-b.herokuapp.com/'
else
  Rails.application.config.session_store :cookie_store, key: '_GlamB'
end
