# frozen_string_literal: true

# Handles creating, deleting and selecting Heroes
class HeroesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hero, only: [:destroy]
  before_action :create_hero, only: [:create]

  STARTING_GEAR = {
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
    @hero.save!
    respond_to do |format|
      if @hero.valid? && @hero_gear.valid?
        @hero.save
        @hero_gear.save
        format.html { redirect_to heroes_path }
      else
        format.html { redirect_to new_hero_path, alert: @hero.errors }
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
    params.require(:hero).permit(
      :name,
      :archetype,
      :gender,
      :race,
      :range,
      :damage
    )
  end

  def set_hero
    @hero = Hero.find(params[:id])
  end

  def create_hero
    @hero = Hero.new(hero_params)
    @hero_gear = HeroGear.new(
      hero: @hero,
      gear: Gear.find(STARTING_GEAR[@hero.archetype] || 1)
    )
  end
end
