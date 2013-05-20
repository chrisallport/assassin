require 'spec_helper'

describe User do
  it "is an admin for any game if the user is an admin" do
    user = User.new
    user.admin = true
    game = Game.new
    user.is_admin_for_game(game).should be true 
  end

  it "is an admin for a game if it's player for the game is an admin" do
    user = User.new
    game = Game.new
    game.id = 1
    player = Player.new
    player.game = game
    player.user = user
    player.game_admin = true
    user.stub(:player_for_game).and_return(player)
    user.is_admin_for_game(game).should be true
  end

  it "is not an admin for a game if it is an admin for only other games"
end
