class UsersController < ApplicationController

  # POST /users/find
  def find
	@user = User.find_by_email(params[:email])
    respond_to do |format|
	  #format.html { redirect_to @user, notice: 'User was successfully created.' }
      format.json { render json: @user.id}
	end
  end

  # POST /users/:id/rating.json
  def create_rating
    @rating = Rating.new(params[:rating])

    respond_to do |format|
      if @rating.save
        #format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @rating, status: :created, location: @rating }
      else
        #format.html { render action: "new" }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /users/:id/ratings.json
  def ratings
    @user = User.find(params[:id])
	@ratings = @user.ratings
    respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @following }
    end
  end
  # GET /users/:id/following_num.json
  def following_num
    @user = User.find(params[:id])
	@following = @user.followed_users.count
    respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @following }
    end
  end
  
  # GET /users/:id/followers_num.json
  def followers_num
    @user = User.find(params[:id])
	@followers = @user.followers.count
    respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @followers }
    end
  end
  # GET /users/:id/following.json
  def following
    @user = User.find(params[:id])
	@following = @user.followed_users
    respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @following }
    end
  end
  
  # GET /users/:id/followers.json
  def followers
    @user = User.find(params[:id])
	@followers = @user.followers
    respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @followers }
    end
  end
  
  # POST /users/:id/follow/:followed_id.json
  def create_relationship
    @relationship = Relationship.new(:follower_id => params[:id], :followed_id => params[:followed_id])
  respond_to do |format|
      if @relationship.save
        #format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @relationship, status: :created, location: @relationship }
      else
        #format.html { render action: "new" }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /users/:id/posts_num.json
  def posts_num
    @user = User.find(params[:id])
	@num_posts = @user.posts.count
    respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @num_posts }
    end
  end
  # GET /users/:id/posts.json
  def posts
    @user = User.find(params[:id])
	@posts = @user.posts
	@posts.each do |p|
		p.word_score = p.word_score
	end
    respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @posts }
    end
  end



  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      #format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      #format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save()
        #format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        #format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        #format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        #format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      #format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
