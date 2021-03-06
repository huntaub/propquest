class UsersController < ApplicationController
  before_filter :authorize, :except => [:show, :login, :new, :create]

  def new
  	@user = User.new
  end

  def edit
 	@user = User.find_by_name(URI.decode(params[:id]))
  	unless User.find_by_id(session[:user_id]) == @user
  		@user = nil
  		redirect_to :controller => 'questions', :action => 'index'
  	end
  end

  def show
  	@user = User.find_by_name(URI.decode(params[:id]))
  	if @user.nil?
  		flash[:notice] = "Stop messing with URLs."
  		redirect_to :controller => 'questions', :action => 'index'
  	end
  	@questions = @user.questions.paginate :per_page => 5, :page => params[:page], :order => 'created_at DESC'
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        flash[:notice] = "User #{@user.name} was successfully created."
        session[:user_id] = @user.id
        format.html { redirect_to(:controller => 'questions', :action => 'index') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
  	if User.find_by_name(URI.decode(params[:id])).update_attributes(params[:user])
  		redirect_to :action => 'show', :id => params[:id]
  	else
  		render :action => 'edit'
  	end
  end

  def destroy
  end
  
  def login
 	if request.post?
  		user = User.authenticate(params[:name], params[:password])
  		if user
  			session[:user_id] = user.id
  			redirect_to(:controller => 'questions', :action => 'index')
  		else
  			flash.now[:notice] = "Invalid user/password combination"
  		end
  	end
  end
  
  def logout
  	session[:user_id] = false
  	redirect_to :controller => 'questions', :action => 'index'
  end
  
  def flagged_questions
  	@user = User.find_by_name(params[:id])
  	@questions = @user.questions.find_all_by_description_needed(true).paginate
  	render "questions/index" 
  end
end
