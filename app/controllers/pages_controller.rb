class PagesController < InheritedResources::Base

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find_by(params[:id])
  end
end
