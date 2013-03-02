class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @can_edit = params[:id].to_i == session[:userid]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    if load_user_if_can_edit
    else
      redirect_to :action=>'show'
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        @current_user = @user
        session[:userid] = @current_user.id
        format.html { redirect_to @current_user, :notice => 'User was successfully created.' }
        format.json { render :json => @current_user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @current_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    respond_to do |format|
      if load_user_if_can_edit
        binding.pry
        @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    load_user_if_can_edit
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  def login
    @current_user = User.find_by_email(params[:email])
    if @user.nil?         # otherwise take them back to the same page
    else                  # If they logged in correctly
    end
    session[:userid] = @current_user.id
    redirect_to "/"
  end
  def logout
    session[:userid]=false
    @current_user = nil
    redirect_to "/"
  end
  def load_user_if_can_edit
    if session[:userid] == params[:id].to_i
      @user = User.find(session[:userid])
    end
    @can_edit = @user != nil
  end
end
