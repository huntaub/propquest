class PagesController < ApplicationController
  before_filter :authorize, :except => [:about]
  def about
  end

end
