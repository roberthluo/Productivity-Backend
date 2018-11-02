class SessionsController < Devise::SessionsController
	prepend_before_filter :verify_user, only: [:destroy]

	def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
  end


  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
	end

	def verify_user
		binding.pry
		redirect_to new_user_session_path, notice: 'You have already signed out. Please sign in again.' and return unless user_signed_in?
	end
	
end