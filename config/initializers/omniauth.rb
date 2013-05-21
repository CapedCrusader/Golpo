OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '197346747081079', 'd7b3c8d63efd16cf2729f6d2584d5c8b', :scope => 'email'
end