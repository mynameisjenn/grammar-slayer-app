class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render 'index.json.jbuilder'
  end

  def show
    user_id = params[:id]
    @user = User.find(user_id)
    render 'show.json.jbuilder'
  end

  def create 
    @user = User.new(
                username: params[:username],
                name: params[:name],
                city: params[:city],
                state: params[:state],
                mini_bio: params[:mini_bio],
                age: params[:age]
                )

    @user.save
    render 'show.json.jbuilder'
  end

  def update
    user_id = params[:id]
    @user = User.find(user_id)

    @user.username = params[:username] || @user.username
    @user.name = params[:name] || @user.name
    @user.city = params[:city] || @user.city
    @user.state = params[:state] || @user.state
    @user.mini_bio = params[:mini_bio] || @user.mini_bio
    @user.age = params[:age] || @user.age

    @user.save
    render 'show.json.jbuilder'
  end

  def destroy
    user_id = params[:id]
    @user = User.find_by(user_id)
    @user.destroy
    render json:{message: "Successfully deleted this user."}
  end

end
