class LinksController < ApplicationController
  def new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to new_link_path(url: @link.long_url, slug: @link.slug)
    else
      render :new
    end

  end

  private

  def link_params
    params.require(:link).permit(:long_url, :slug)
  end
end
