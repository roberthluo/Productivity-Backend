class StaticPagesController < ApplicationController
	def home
		@productivity_image = view_context.image_path('productivity.jpg')
		@slogan = "Be productive"
  end

  def help
  end

  def contact
  end
end
