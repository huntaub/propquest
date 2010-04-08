class AnswersController < ApplicationController
  before_filter :authorize, :except => [:show]
  def show
  	@answer = Answer.find_by_id(params[:id])
  	@questions = @answer.questions.paginate :per_page => 8, :page => params[:page], :order => 'created_at DESC'
  	render 'questions/index'
  end

end