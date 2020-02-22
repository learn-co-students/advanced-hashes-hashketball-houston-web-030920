require 'pp'
require 'pry'

def game_hash
  game_info = {:home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [{
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
      }]
    },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [{
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
      }]
    }
  }
  game_info
end

def num_points_scored(player)
  output = 0
  game_hash.each do |location, team_data|
    game_hash[location][:players].each do |player_data|
      if player == player_data[:player_name]
        output = player_data[:points]
      end
    end 
  end
  output
end

def shoe_size(player)
  output = 0
  game_hash.each do |location, team_data|
    game_hash[location][:players].each do |player_data|
      if player == player_data[:player_name]
        output = player_data[:shoe]
      end
    end
  end 
  output
end 

def team_colors(team)
  color_output = ""
  game_hash.each do |location, team_data|
    if game_hash[location][:team_name] == team
      color_output = game_hash[location][:colors]
    end
  end
  color_output
end

def team_names()
  output = []
  game_hash.each do |location, team_data|
    output << game_hash[location][:team_name]
  end
  output
end

def player_numbers(team)
  output = []
  game_hash.each do |location, team_data|
    if team == game_hash[location][:team_name]
      game_hash[location][:players].each do |player_data|
        output << player_data[:number]
      end
    end
  end
  output
end
  
def player_stats(player)
  output = {}
  game_hash.each do |location, team_data|
    game_hash[location][:players].each do |player_data|
      if player == player_data[:player_name]
        output = {
        :number => player_data[:number],
        :shoe => player_data[:shoe], 
        :points => player_data[:points],
        :rebounds => player_data[:rebounds],
        :assists => player_data[:assists],
        :steals => player_data[:steals],
        :blocks => player_data[:blocks],
        :slam_dunks => player_data[:slam_dunks]
        }
      end
    end
  end
  output
end

def big_shoe_rebounds
  input = 0
  output = 0
  game_hash.each do |location, team_data|
    game_hash[location][:players].each do |player_data|
      if input < player_data[:shoe]
        input = player_data[:shoe]
        output = player_data[:rebounds]
      end
    end
  end
  output
end 

def most_points_scored
  input = 0
  output = ""
  game_hash.each do |location, team_data|
    game_hash[location][:players].each do |player_data|
      if input < player_data[:points]
        input = player_data[:points]
        output = player_data[:player_name]
      end
    end 
  end
  output
end 

def winning_team
  home_input = 0 
  away_input = 0
  output = "#{game_hash[:home][:team_name]}"
  game_hash[:home][:players].each do |player_details|
    home_input += player_details[:points]
  end
  game_hash[:away][:players].each do |player_details|
    away_input += player_details[:points]
  end
  if home_input < away_input 
    output = "#{game_hash[:home][:team_name]}"
  elsif home_input == away_input 
    output = "The game ended in a tie"
  end 
  output
end 

def player_with_longest_name
  output = ""
  game_hash.each do |location, team_data|
    game_hash[location][:players].each do |player_data|
      if output.length < player_data[:player_name].length
        output = player_data[:player_name]
      end
    end
  end
  output
end 
  
def long_name_steals_a_ton?
  input = game_hash[:away][:players][1][:points]
  output = nil 
  game_hash.each do |location, team_data|
    game_hash[location][:players].each do |player_data|
      if input < player_data[:steals]
        output = true
      end
    end
  end
  output
end 