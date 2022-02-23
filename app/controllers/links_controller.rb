class LinksController < ApplicationController

  def new
  end

  def create

    @link = Link.new(link_params)
    @link.slug = SecureRandom.base64(8)

    @bitesize_url = "http://127.0.0.1:3000/" + @link.slug

    if @link.save
      redirect_to new_link_path(short_url: @bitesize_url)
    else
      render :new
    end

  end

  private

  def link_params
    params.require(:link).permit(:long_url, :slug)
  end
end
