class FeedsController < ApplicationController

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new feed_params
    if @feed.save
      redirect_to feeds_path
    else
      render action: :new
    end
  end

  def edit
    @feed = Feed.find_by(id: params[:id])
    unless @feed
      render action: :index
    end
  end

  def update
    @feed = Feed.find_by(id: params[:id])
    if @feed && @feed.update_attributes(feed_params)
      redirect_to feeds_path
    else
      render action: :edit
    end
  end

  def index
    @feeds = Feed.all
  end

  def destroy
    @feed = Feed.find_by(id: params[:id])
    unless @feed && @feed.destroy
      @feeds = Feed.all
      render action: :index
    end
  end

  private

    def feed_params
      params.require(:feed).permit(:url)
    end
end
