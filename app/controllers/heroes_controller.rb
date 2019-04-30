# frozen_string_literal: true

# Handles creating, deleting and selecting Heroes
class HeroesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hero, only: [:destroy]

  def index
    @heroes = Hero.all
  end

  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.new(hero_params)

    respond_to do |format|
      if @hero.save
        format.html { redirect_to heroes_path }
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @hero.delete
        format.html { redirect_to heroes_path }
        format.js
      end
    end
  end

  private

  def hero_params
    params.require(:hero).permit(:name, :archetype, :gender)
  end

  def set_hero
    @hero = Hero.find(params[:id])
  end
end
