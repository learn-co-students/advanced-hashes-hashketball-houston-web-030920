require 'pp'

def game_hash
  game = {
    :home => {

      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players =>[
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      ]

    },

    :away =>{

      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]

    }
  }

  game
end

def num_points_scored(name)
  game = game_hash
  game.each do |team,team_stats|
    team_stats[:players].each do |player_info|
      if player_info[:player_name] == name
        return player_info[:points]
      end
    end
  end
  nil

end

def shoe_size(name)
  game = game_hash
  game.each do |team,team_stats|
    team_stats[:players].each do |player_info|
      if player_info[:player_name] == name
        return player_info[:shoe]
      end
    end
  end
  nil

end

def team_colors(team)
  game = game_hash
  game.each do |teams,team_stats|
    if team_stats[:team_name] == team
       return team_stats[:colors]
    end
  end
  nil
end

def team_names
  game = game_hash
  game.collect {|teams,team_stats| team_stats[:team_name]}
end

def player_numbers(team)
  game = game_hash
  game.each do |teams,team_stats|
    if team_stats[:team_name] == team
      return team_stats[:players].collect do |player_info|
         player_info[:number]
      end
    end
  end
end

def player_stats(player)
  game = game_hash
  result = {}
  game.each do |team,team_stats|
    team_stats[:players].each do |player_info|
      if player_info[:player_name] == player
        return player_info.slice(:assists,:blocks,:number,:points,:rebounds,:shoe,:slam_dunks,:steals)
      end
    end
  end
  nil

end

def big_shoe_rebounds
  game = game_hash
  size = 0
  game.each do |team,team_stats|
    team_stats[:players].each do |player_info|
      if player_info[:shoe] > size
        size = player_info[:shoe]
      end
    end
  end


  game.each do |team,team_stats|
    team_stats[:players].each do |player_info|
      if player_info[:shoe] == size
        return player_info[:rebounds]
      end
    end
  end
end

def most_points_scored
  game = game_hash
  point = 0
  game.each do |team,team_stats|
    team_stats[:players].each do |player_info|
      if player_info[:points] > point
        point = player_info[:points]
      end
    end
  end

  game.each do |team,team_stats|
    team_stats[:players].each do |player_info|
      if player_info[:points] == point
        return player_info[:player_name]
      end
    end
  end
end

def winning_team
  game = game_hash
  home_points = 0
  away_points = 0

  game[:home][:players].each do |player_info|
    home_points += player_info[:points]
    end

  game[:away][:players].each do |player_info|
      away_points += player_info[:points]
      end

  if home_points > away_points
    return game[:home][:team_name]
  end
  game[:away][:team_name]
end

def player_with_longest_name
  game = game_hash
  size = 0
  game.each do |team,team_stats|
    team_stats[:players].each do |player_info|
      if player_info[:player_name].length > size
        size = player_info[:player_name].length
      end
    end
  end

  game.each do |team,team_stats|
    team_stats[:players].each do |player_info|
      if player_info[:player_name].length == size
        return player_info[:player_name]
      end
    end
  end
end

def long_name_steals_a_ton?
  true
end
