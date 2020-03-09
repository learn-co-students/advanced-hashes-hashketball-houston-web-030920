def game 
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [ 
        {
          :player_name => "Alan Anderson",
          :stats => {
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
            }
          },
        {
          :player_name => "Reggie Evans",
          :stats => {
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
            }
          },
        {
          :player_name => "Brook Lopez",
          :stats => {
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19, 
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
            }
          }, 
        {
          :player_name => "Mason Plumlee",
          :stats => {
            :number => 1,
            :shoe => 19,
            :points => 26, 
            :rebounds => 11, 
            :assists => 6, 
            :steals => 3,
            :blocks => 8, 
            :slam_dunks => 5 
            }
          },
        {
          :player_name => "Jason Terry",
          :stats => {
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4, 
            :blocks => 11,
            :slam_dunks => 1
            }
          },  
        ]
      },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [ 
        { 
          :player_name => "Jeff Adrien",
          :stats => {
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
            }
          },
        {
          :player_name => "Bismack Biyombo",
          :stats => {
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10
            }
          },
        {
          :player_name => "DeSagna Diop",
          :stats => {
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12, 
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
            }
          }, 
        {
          :player_name => "Ben Gordon",
          :stats => {
            :number => 8,
            :shoe => 15,
            :points => 33, 
            :rebounds => 3, 
            :assists => 2, 
            :steals => 1,
            :blocks => 1, 
            :slam_dunks => 0
            }
          },
        {
          :player_name => "Kemba Walker",
          :stats => {
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7, 
            :blocks => 5,
            :slam_dunks => 12
            }
          },  
        ]
      }  
    }
end 

def game_hash
  return game
end

def num_points_scored(name)
  game.each do |location, team_info|
    team_info[:players].each do |player|
      if player[:player_name] == name
        return player[:stats][:points]
      end
    end
  end
end  

def shoe_size(name)
  game.each do |location, team_info|
    team_info[:players].each do |player|
      if player[:player_name] == name
        return player[:stats][:shoe]
      end
    end
  end
end  

def team_colors(name)
  game.each do |location, team_info|
    if team_info[:team_name] == name
        return team_info[:colors]
    end
  end
end  

def team_names
  team = []
  game.each do |location, team_info|
    team_info.each do |k, v|
      if k == :team_name
        team.push(v)
      end
    end
  end
  return team
end

def player_numbers(name)
  numbers = []
  game.each do |location, team_info|
    if team_info[:team_name] == name
      team_info[:players].each do |player|
        n = player[:stats][:number]
        numbers.push(n)
      end
    end  
  end
  return numbers
end 

def player_stats(name)
  game.each do |location, team_info|
    team_info[:players].each do |player|
      if player[:player_name] == name
        return player[:stats]
      end
    end
  end
end

def big_shoe_rebounds
biggest_shoe_size = 0
num_rebounds = 0
  game.each do |location, team_info|
    team_info[:players].each do |player|
      n = player[:stats][:shoe]
      if n > biggest_shoe_size
        biggest_shoe_size = n 
        num_rebounds = player[:stats][:rebounds]
      end
    end
  end
  return num_rebounds
end

def most_points_scored
points_scored = 0
team_member = ""
  game.each do |location, team_info|
    team_info[:players].each do |player|
      points = player[:stats][:points]
      if points > points_scored
        points_scored = points
        team_member = player[:player_name]
      end
    end
  end
  return team_member
end

def winning_team
  total_points = 0 
  game.each do |location, team_info|
    team_info[:players].each do |player|
      points = player[:stats][:points]
      score = 0
      while score < points do
        total_points += points
        score += 1 
      end
    end  
  end      
  return total_points
end
