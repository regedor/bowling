class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(params[:game])
    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @game = Game.find(params[:id])
    begin
      flash[:notice] = view_context.display_roll_results @game.roll!(params[:pins_to_knock_down].to_i)
    rescue
      flash[:notice] = "Invalid Play! Don't cheat please."
    end
    redirect_to :action => :show
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_url
  end
end
