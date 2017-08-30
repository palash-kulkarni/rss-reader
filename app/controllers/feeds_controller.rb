class FeedsController < ApplicationController
  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new feed_params
    if @feed.save
      redirect_to articles_path
    else
      render action: :new
    end
  end

  private

    def feed_params
      params.require(:feed).permit(:url)
    end
end
