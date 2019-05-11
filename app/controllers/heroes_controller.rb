# frozen_string_literal: true

# Handles creating, deleting and selecting Heroes
class HeroesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hero, only: [:destroy]

  GEAR = {
    'tank' => 1,
    'dps' => 2,
    'healer' => 3
  }.freeze

  def index
    @heroes = Hero.all
  end

  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.new(hero_params)
    @hero_gear = HeroGear.new(
      hero: @hero,
      gear: Gear.find(GEAR[params[:hero][:archetype]])
    )

    respond_to do |format|
      if @hero.save
        @hero_gear.save
        format.html { redirect_to heroes_path }
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @hero.destroy
        format.html { redirect_to heroes_path }
        format.js
      end
    end
  end

  private

  def hero_params
    params.require(:hero).permit(:name, :archetype, :gender, :race)
  end

  def set_hero
    @hero = Hero.find(params[:id])
  end
end
