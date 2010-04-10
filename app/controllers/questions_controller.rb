class QuestionsController < ApplicationController
  before_filter :authorize, :except => [:index, :show, :section, :quiz_options, :quiz, :top_rated]
  # GET /questions
  # GET /questions.xml
  def index
  	@question = Question.find(:all)
  	@question.each do |q|
  		if q.vote_int.nil?
  			q.vote_int = 0
  			q.save!
  		end
  	end
    @questions = Question.paginate :per_page => 8, :page => params[:page], :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.xml
  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.xml
  def new
  	response.headers['Cache-Control'] = 'public, max-age=86400'
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
    @user = User.find(session[:user_id])
    unless @question.user == @user || @user.role == 1
      @question = nil
      @user = nil
      flash[:notice] = "Stop messing with URLs."
      redirect_to :action => "index"
    end
  end

  # POST /questions
  # POST /questions.xml
  def create
    @question = Question.new(params[:question])
	@question.votes = 0
	@question.user = User.find_by_id(session[:user_id])
    respond_to do |format|
      if @question.save
        flash[:notice] = 'Question was successfully created.'
        format.html { redirect_to(@question) }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.xml
  def update
    @question = Question.find(params[:id])
    @user = User.find(session[:user_id])
    unless @question.user == @user || @user.role == 1
      @question = nil
      @user = nil
      flash[:notice] = "Stop messing with URLs."
      redirect_to :action => "index"
    end

    respond_to do |format|
      if @question.update_attributes(params[:question])
        flash[:notice] = 'Question was successfully updated.'
        format.html { redirect_to(@question) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.xml
  def destroy
    @question = Question.find(params[:id])
    unless @question.user == User.find(session[:user_id])
      @question = nil
      flash[:notice] = "Stop messing with URLs."
      redirect_to :action => "index"
    end
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(questions_url) }
      format.xml  { head :ok }
    end
  end
  
  def add_vote
  	if request.xhr?
	  	@question = Question.find(params[:id])
	  	@question.vote_int += 1
	  	@question.save!
	  	vote = Vote.create
	  	vote.up = true
	  	vote.question_id = @question.id
	  	vote.user_id = params[:user]
	  	vote.save!
	  	render :partial => 'votes', :locals => {:question => @question}
  	else
  		redirect_to :action => 'index'
  	end
  end
  
  def remove_vote
  	if request.xhr?
	  	@question = Question.find(params[:id])
	  	@question.vote_int -= 1
	  	@question.save!
	  	vote = Vote.create
	  	vote.up = false
	  	vote.question_id = @question.id
	  	vote.user_id = params[:user]
	  	vote.save!
	  	render :partial => 'votes', :locals => {:question => @question}
  	else
  		redirect_to :action => 'index'
  	end
  end
  
 def rate
 	if request.xhr?
 		@question = Question.find(params[:id])
 	end
 end
 
 def rate_change
 	if request.xhr?
	 	@question = Question.find(params[:id])
	 	if @question.d_total.blank?
	 		@question.d_total = 0
	 		@question.d_length = 0
	 	end
	 	@question.d_total += Integer(params[:choice])
	 	@question.d_length += 1
	 	@question.save!
	 	render :update do |page|
	 		page.replace_html 'rate'+params[:id].to_s, :partial => 'link_to_rate', :locals => {:question => @question}
	 		page.replace_html 'rating'+params[:id].to_s, :partial => 'current_rate', :locals => {:question => @question}
 		end
 	else
 		redirect_to :action => 'index'
 	end
 end
 
 def search_answers
 	if request.xhr?
	 	@section = Section.find(params[:section])
	 	render :update do |page|
	 		page.replace_html 'answer', :partial => 'search_answers'
	 	end
 	else
 		redirect_to :action => 'index'
 	end
 end
 
 def section
	@section = Section.find(params[:id])
 	@questions = @section.questions.paginate :per_page => 8, :page => params[:page], :order => 'created_at DESC'
 	respond_to do |format|
 	  format.html { render "index" }
 	  format.xml  { render :xml => @questions }
 	end
 end
 
 def quiz_options
 	@sections = Section.find(:all)
 end
 
 def quiz
 	unless request.post?
	 	session[:questions] = params[:questions]
	 	session[:q_num] = 1
	 	session[:section] = params[:id]
	 	session[:score] = 0
	 	@section = Section.find_by_id(params[:id])
	 	@question = Question.random(params[:id])
	 	render "quiz/quiz"
 	else 
 		session[:q_num] += 1
 		@old_question = Question.find(params[:question])
 		if params[:id].to_i == @old_question.answer.id
 			session[:score] += 4
 			@correct = true
 		else 
 			session[:score] -= 2
 			@answer = Question.find(params[:question]).answer
 			@correct = false
 		end
 		@section = Section.find_by_id(session[:section])
 		@question = Question.random(session[:section])
 		
 		unless session[:q_num].to_i > session[:questions].to_i
	 		render "quiz/quiz"	
 		else
 			render "quiz/end"
 		end
 		
 	end
 end
 
 def top_rated
 	if params[:id].blank?
 		@questions = Question.paginate :per_page => 8, :page => params[:page], :order => 'vote_int DESC'
 	else
 		@section = Section.find(params[:id])
 		@questions = @section.questions.paginate :per_page => 8, :page => params[:page], :order => 'vote_int DESC'
 	end
    respond_to do |format|
      format.html { render 'index' }
      format.xml  { render :xml => @questions }
    end
 end
 
 def flag
 	@question = Question.find_by_id(params[:id])
 	@question.description_needed = true
 	@question.save!
 	render "show"
 end
end
