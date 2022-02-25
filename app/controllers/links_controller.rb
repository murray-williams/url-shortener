class LinksController < ApplicationController
  def new
  end

  def create

    @link = Link.new(link_params)
    @link.slug = SecureRandom.base64(8)
    @long_url = @link.long_url

    @bitesize_url = "https://mysterious-beach-71329.herokuapp.com/" + @link.slug

    if @link.save
      redirect_to new_link_path(short_url: @bitesize_url,long_url: @long_url)
    else
      render :new
    end

  end

  def show
    split_url = request.fullpath.split("/")
    find_url_matching_slug = Link.where(slug: split_url[-1])
    redirect_url = find_url_matching_slug.first.long_url

    redirect_to redirect_url
  end

  private

  def link_params
    params.require(:link).permit(:long_url, :slug)
  end
end
