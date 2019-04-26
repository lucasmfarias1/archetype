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

  private
  def hero_params
    params.require(:hero).permit(:name, :job, :gender, :race)
  end
end
