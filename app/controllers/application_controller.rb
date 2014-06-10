class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
  	# Construye path con los parametros enviados 
  	# Ver: http://api.rubyonrails.org/classes/ActionDispatch/Routing/PolymorphicRoutes.html#method-i-polymorphic_path 
  	#polymorphic_path([:dashboard,resource.profileable_type.pluralize.downcase.to_sym])
  	'/soon'
  end
end
