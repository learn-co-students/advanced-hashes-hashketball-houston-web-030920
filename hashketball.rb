
  def game_hash 
  {:home => {
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
    },{:player_name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
    },{:player_name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
    },{:player_name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 11,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
    },{:player_name => "Jason Terry",
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
    },{:player_name => "Bismack Biyombo",
      :number => 0,
      :shoe => 16,
      :points => 12, 
      :rebounds => 4, 
      :assists => 7,
      :steals => 22,
      :blocks => 15,
      :slam_dunks => 10
    },{:player_name => "DeSagna Diop",
      :number => 2,
      :shoe => 14,
      :points => 24, 
      :rebounds => 12, 
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
    },{:player_name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33, 
      :rebounds => 3, 
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
    },{:player_name => "Kemba Walker",
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
end

def num_points_scored (player_name)
  homeplayers = game_hash[:home][:players]
  awayplayers = game_hash[:away][:players]
  allplayers = homeplayers.concat(awayplayers)
  index=0 
  while index < allplayers.count do 
     playername = allplayers[index][:player_name]
     if playername == player_name
      points=allplayers[index][:points]
      return points
     end
     index += 1
  end
  return nil 
end

def shoe_size (player_name)
  homeplayers= game_hash[:home][:players]
  awayplayers= game_hash[:away][:players]
  allplayers= homeplayers.concat(awayplayers)
  index=0 
  while index<allplayers.count do 
    playername = allplayers[index][:player_name]
    if playername == player_name
    shoesize = allplayers[index][:shoe]   
    return shoesize
    end 
    index += 1 
  end
  return nil 
end 
  
def team_colors (team_name)
  hometeam = game_hash[:home]
  homename = hometeam[:team_name]
  if homename == team_name
    return hometeam[:colors]
  end
  
awayteam = game_hash[:away]
awayname = awayteam[:team_name]
  if awayname == team_name
  return awayteam[:colors]
  end 
return nil 
end

def team_names 
  teamname = []
  homename = game_hash[:home][:team_name]
  awayname = game_hash[:away][:team_name]
  teamname.push(homename)
  teamname.push(awayname)
  return teamname
end 

def player_numbers (team_name)
  number=[]
  hometeam = game_hash[:home][:team_name]
  awayteam = game_hash[:away][:team_name]
  if hometeam == team_name
    team = game_hash[:home]
  else 
    team = game_hash[:away]
  end
  players=team[:players]
  index=0 
  while index<players.count do 
    jersey=players[index][:number]
    number.push(jersey)
    index += 1
  end
  number
end 

 def player_stats (player_name)
  stats = {}
  homeplayers= game_hash[:home][:players]
  awayplayers= game_hash[:away][:players]
  allplayers= homeplayers.concat(awayplayers)
  index=0 
  while index<allplayers.count do 
    playername = allplayers[index][:player_name]
    if playername == player_name
      stats = allplayers[index]
      stats.delete(:player_name)
    end
    index += 1
  end 
    stats
end
  
 def big_shoe_rebounds
  homeplayers= game_hash[:home][:players]
  awayplayers= game_hash[:away][:players]
  allplayers= homeplayers.concat(awayplayers)
  i=0 
  biggestshoeplayer= allplayers[0]
  while i < allplayers.count do 
    if allplayers[i][:shoe]>biggestshoeplayer[:shoe]
      biggestshoeplayer=allplayers[i]
    end 
    i += 1
  end
  biggestshoeplayer[:rebounds]
end

def most_points_scored 
  homeplayers= game_hash[:home][:players]
  awayplayers= game_hash[:away][:players]
  allplayers= homeplayers.concat(awayplayers)
  i=0 
  playerwithmostpoints=allplayers[0]
  while i< allplayers.count do 
    if allplayers[i][:points]>playerwithmostpoints[:points]
      playerwithmostpoints=allplayers[i]
    end 
    i += 1
  end 
  playerwithmostpoints[:player_name]
end 

def player_with_longest_name 
    homeplayers= game_hash[:home][:players]
    awayplayers= game_hash[:away][:players]
    allplayers= homeplayers.concat(awayplayers)
    i=0 
    playerwithlongestname=allplayers[0]
    while i<allplayers.count do
      if allplayers[i][:player_name].length > playerwithlongestname[:player_name].length 
        playerwithlongestname= allplayers[i]
    end
    i += 1
  end 
  playerwithlongestname[:player_name]
end 
     
def winning_team 
  hometeam = game_hash[:home]
  awayteam = game_hash[:away]
  hometotal= 0 
  awaytotal=0
  homeplayers = game_hash[:home][:players]
  i=0 
  while i<homeplayers.count do 
    points=homeplayers[i][:points]
    hometotal += points 
    i += 1
  end 
  awayplayers = game_hash[:away][:players]
  i=0 
  while i< awayplayers.count do 
    points = awayplayers[i][:points]
    awaytotal += 1 
    i += 1 
  end 
  if awaytotal > hometotal
    return awayteam[:team_name]
  else 
    return hometeam[:team_name]
  end 
  
end
  
def long_name_steals_a_ton?
  
  name = player_with_longest_name
  homeplayers = game_hash[:home][:players]
  awayplayers = game_hash[:away][:players]
  allplayers = homeplayers.concat(awayplayers)
  i=0 
  higheststeals= allplayers[0]
  while i < allplayers.count do 
    if  allplayers[i][:steals]>higheststeals[:steals]
      higheststeals=allplayers[i]
    end 
    i += 1
  end 
  if name == higheststeals[:player_name]
    return true 
  end 
  retun false 
  
end
    
    
  
  
  





