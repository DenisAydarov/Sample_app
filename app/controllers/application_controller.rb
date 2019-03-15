class ApplicationController < ActionController::Base
	protect_from_forgetry with: :exception
	include SessionsHelper
end
