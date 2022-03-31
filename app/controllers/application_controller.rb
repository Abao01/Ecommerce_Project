class ApplicationController < ActionController::Base
  helper_method :mes_pages
  def mes_pages
    Page.all
  end
end
