class HeroesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @heroes = Hero.all
  end

  def new
    @hero = Hero.new
  end

  def create
    Hero.create(hero_params)
    redirect_to heroes_path
  end

  def destroy
    @hero = Hero.find(params[:id])
    respond_to do |format|
      if @hero.delete
        format.html { redirect_to heroes_path }
        format.js
      end
    end
  end

  private
  def hero_params
    params.require(:hero).permit(:name, :archetype, :job, :gender, :race)
  end
end
