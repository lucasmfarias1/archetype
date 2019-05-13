class CpanelController < ApplicationController
  def index
  end

  def heroes
    @heroes = Hero.all
  end

  def users
    @users = User.all
  end
end
