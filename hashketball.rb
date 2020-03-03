require 'pry'

def game_hash
  hash = Hash.new
  hash[:home] = {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [{:player_name => "Alan Anderson",
                  :number => 0, 
                  :shoe => 16,
                  :points => 22,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 1},
                  
                  {:player_name => "Reggie Evans",
                  :number => 30, 
                  :shoe => 14,
                  :points => 12,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 12,
                  :blocks => 12,
                  :slam_dunks => 7},
                  
                  {:player_name => "Brook Lopez",
                  :number => 11, 
                  :shoe => 17,
                  :points => 17,
                  :rebounds => 19,
                  :assists => 10,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 15},
                  
                  {:player_name => "Mason Plumlee",
                  :number => 1, 
                  :shoe => 19,
                  :points => 26,
                  :rebounds => 11,
                  :assists => 6,
                  :steals => 3,
                  :blocks => 8,
                  :slam_dunks => 5},
                  
                  {:player_name => "Jason Terry",
                  :number => 31, 
                  :shoe => 15,
                  :points => 19,
                  :rebounds => 2,
                  :assists => 2,
                  :steals => 4,
                  :blocks => 11,
                  :slam_dunks => 1}]
  }
  
  hash[:away] = {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [{:player_name => "Jeff Adrien",
                  :number => 4, 
                  :shoe => 18,
                  :points => 10,
                  :rebounds => 1,
                  :assists => 1,
                  :steals => 2,
                  :blocks => 7,
                  :slam_dunks => 2},
                  
                  {:player_name => "Bismack Biyombo",
                  :number => 0, 
                  :shoe => 16,
                  :points => 12,
                  :rebounds => 4,
                  :assists => 7,
                  :steals => 22,
                  :blocks => 15,
                  :slam_dunks => 10},
                  
                  {:player_name => "DeSagna Diop",
                  :number => 2, 
                  :shoe => 14,
                  :points => 24,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 4,
                  :blocks => 5,
                  :slam_dunks => 5},
                  
                  {:player_name => "Ben Gordon",
                  :number => 8, 
                  :shoe => 15,
                  :points => 33,
                  :rebounds => 3,
                  :assists => 2,
                  :steals => 1,
                  :blocks => 1,
                  :slam_dunks => 0},
                  
                  {:player_name => "Kemba Walker",
                  :number => 33, 
                  :shoe => 15,
                  :points => 6,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 7,
                  :blocks => 5,
                  :slam_dunks => 12}]
  }
  hash
end 

#-------------------------------------------------------

def num_points_scored(player_name)
  point = 0 
  game_hash.keys.each do |key|
    game_hash[key][:players].map do |k|
      if k[:player_name] == player_name
        point = k[:points]
      end
    end 
  end
  point
end

#-------------------------------------------------------

def shoe_size(player_name)
  shoe_size = 0 
  
  game_hash.keys.each do |key|
    game_hash[key][:players].map do |k|
      if k[:player_name] == player_name
        shoe_size = k[:shoe]
      end
    end 
  end
  shoe_size
end

#-------------------------------------------------------

def team_colors(team_name)
  colors = ""
  game_hash.keys.each do |team|
    if game_hash[team][:team_name] == team_name
      colors = game_hash[team][:colors]
    end
  end
  colors
end

#-------------------------------------------------------

def team_names
  team_names_array = []
  game_hash.keys.each do |team|
    team_names_array << game_hash[team][:team_name]
  end 
  team_names_array
end

#-------------------------------------------------------

def player_numbers(team_name)
  team_player_nums = [] 
  
  game_hash.keys.each do |key|
    if game_hash[key][:team_name] == team_name
      game_hash[key][:players].map do |player_num|
        team_player_nums << player_num[:number]
      end
    end
  end
  team_player_nums
end

#-------------------------------------------------------

def player_stats (player_name)
  player_stat = ''
  
  game_hash.keys.each do |key|
    game_hash[key][:players].map do |k|
      if k[:player_name] == player_name
        player_stat = k
        player_stat.delete(:player_name)
      end
    end
  end
  player_stat
end

#-------------------------------------------------------

def big_shoe_rebounds
  biggest_shoe_size = 0
  rebound = 0
  
  game_hash.keys.each do |team|
    game_hash[team][:players].each do |k|
      if k[:shoe] > biggest_shoe_size 
        biggest_shoe_size = k[:shoe]
      end
    end
  end
  
  game_hash.keys.each do |team|
    game_hash[team][:players].each do |n|
      if n[:shoe] == biggest_shoe_size
        rebound = n[:rebounds]
      end
    end
  end
  rebound
end

#-------------------------------------------------------

def most_points_scored
  point = 0
  player_name = ""
  
  game_hash.keys.each do |team|
    game_hash[team][:players].each do |k|
      if k[:points] > point 
        point = k[:points]
      end
    end
  end 
  
  game_hash.keys.each do |team|
    game_hash[team][:players].each do |n|
      if n[:points] == point
        player_name = n[:player_name]
      end
    end
  end
  player_name
end

#-------------------------------------------------------

def winning_team
 home_team_points = 0
 away_team_points = 0
 
 game_hash[:home][:players].each do |k|
    home_team_points += k[:points]
  end
  game_hash[:away][:players].each do |k|
    away_team_points += k[:points]
  end
  
  if home_team_points > away_team_points
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

#-------------------------------------------------------

def player_with_longest_name
  player_names_array = []
  
  game_hash.keys.each do |team|
    game_hash[team][:players].each do |k|
      player_names_array << k[:player_name]
    end
  end
  player_names_array.sort_by(&:length).last 
end

#-------------------------------------------------------

# def long_name_steals_a_ton?
  
# end