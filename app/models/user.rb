class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :players

  def is_admin_for_game game
    return true if admin
    player = player_for_game game.id
    return player.game_admin if player 
    return false 
  end

  private

  def player_for_game game_id
    players.where(game_id: game_id).first
  end
end
