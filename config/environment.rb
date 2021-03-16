# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# This will remove the hidden field_with_errors in html forms

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end
