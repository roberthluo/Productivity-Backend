class StaticPagesController < ApplicationController
	def home
		@cover_image = view_context.image_path('cover.jpg')
		@slogan = "Tmp"
  end

  def help
  end

  def contact
  end
end
