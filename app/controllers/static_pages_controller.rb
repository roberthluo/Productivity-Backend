class StaticPagesController < ApplicationController
	def home
		@productivity_image = view_context.image_path('minion_home.jpg')
		@slogan = "Tmp"
  end

  def help
  end

  def contact
  end
end
