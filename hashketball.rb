require 'pry'

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
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
    
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
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
end

def num_points_scored(players_name)
  game_hash.each do |loc, team|
    team.each do |att, data|
      if att == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |loc, team|
    team.each do |att, data|
      if att == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |loc, team|
    team.each do |att, data|
      if att == :team_name && data == team_name
        return team[:colors]
      end
    end
  end
end

def team_names
  names = []
  game_hash.each do |loc, team|
    names << team[:team_name]
  end
  names
end

def player_numbers(team_name)
  j_arr = []
  game_hash.each do |loc, team|
    if team[:team_name] == team_name
      team.each do |att, data|
        if att == :players
          data.each do |number|
            j_arr << number[:number]
          end
        end
      end
    end
  end
  j_arr
end

def player_stats(players_name)
  game_hash.each do |loc, team|
    team.each do |att, data|
      if att == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player.reject {|i| i == :player_name}
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  big_shoe_size = 0
  rebounds = 0
  game_hash.each do |loc, team|
    team.each do |att, data|
      if att == :players
        data.each do |player|
          size = player[:shoe]
          if size > big_shoe_size
            big_shoe_size = size
            rebounds = player[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end

def most_points_scored
  high_score = 0
  p_score = ""
  game_hash.each do |loc, team|
    team.each do |att, data|
      if att == :players
        data.each do |player|
          score = player[:points]
          if score > high_score
            high_score = score
            p_score = player[:player_name]
          end
        end
      end
    end
  end
  p_score
end

def winning_team
  t_score = 0
  t_winner = ""
  game_hash.each do |loc, team|
    t_name = team[:team_name]
    t_points = 0
    team[:players].each do |points|
      t_points += points[:points]
    end
    if t_points > t_score
      t_score = t_points
      t_winner = t_name
    end
  end
  t_winner
end

def names
  names = []
  game_hash.each do |loc, team|
    team.each do |att, data|
      if att == :players
        data.each do |players|
          names << players[:player_name]
        end
      end
    end
  end
  names
end

def player_with_longest_name
  names.max_by {|n| n.length}
end

def long_name_steals_a_ton?
  p_steals = player_stats(player_with_longest_name)[:steals]
  steals = []
  counter = 0
  while counter < names.length do
    steals << player_stats(names[counter])[:steals]
    if steals.max == p_steals
      return true
    end
    counter += 1
  end
  false
end





