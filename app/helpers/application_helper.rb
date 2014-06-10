module ApplicationHelper
	def my_devise_error_messages!
		return "" if resource.errors.empty?
		#return "" if not resource.profileable.nil? && resource.profileable.errors.empty?

		messages = profileable_messages = ""

		if !resource.errors.empty?
		  messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
		end

		if !resource.profileable.errors.empty?
		  profileable_messages = resource.profileable.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
		end

		messages = messages + profileable_messages   
		sentence = I18n.t("errors.messages.not_saved",
		                  :count => resource.errors.count + resource.profileable.errors.count,
		                  :resource => resource.class.model_name.human.downcase)

		html = <<-HTML
		<div id="error_explanation">
		<h2>#{sentence}</h2>
		<ul>#{messages}</ul>
		</div>
		HTML

		html.html_safe
	end
end
