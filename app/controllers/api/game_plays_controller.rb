class Api::GamePlaysController < ApplicationController
  def index
    @game_plays = GamePlay.all.order(score: :desc)
    render 'index.json.jbuilder'
  end

  def show
    game_play_id = params[:id]
    @game_play = GamePlay.find(game_play_id)
    render 'show.json.jbuilder'
  end

  def create
    @game_play = GamePlay.new( 
                                user_id: params[:user_id], 
                                score: params[:score],
                                level: params[:level]
                              )

    @game_play.save
    render 'index.json.jbuilder'
  end
  
end
