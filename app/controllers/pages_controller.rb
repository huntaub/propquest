class PagesController < ApplicationController
  before_filter :authorize, :except => [:about]
  def about
    response.headers['Cache-Control'] = 'public, max-age=86400'
  end

end