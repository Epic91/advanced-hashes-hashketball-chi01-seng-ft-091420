require "pry"
def game_hash
  {
    home: {
        team_name: "Brooklyn Nets",
        colors: ["Black", "White"],
        players: [
          {
            player_name: "Alan Anderson",
            number: 0,
            shoe: 16,
            points: 22,
            rebounds: 12,
            assists: 12,
            steals: 3,
            blocks: 1,
            slam_dunks: 1
          },
          {
            player_name: "Reggie Evans",
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7
          },
          {
            player_name: "Brook Lopez",
            number: 11,
            shoe: 17,
            points: 17,
            rebounds: 19,
            assists: 10,
            steals: 3,
            blocks: 1,
            slam_dunks: 15
          },
          {
            player_name: "Mason Plumlee",
            number: 1,
            shoe: 19,
            points: 26,
            rebounds: 11,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5
          },
          {
            player_name: "Jason Terry",
            number: 31,
            shoe: 15,
            points: 19,
            rebounds: 2,
            assists: 2,
            steals: 4,
            blocks: 11,
            slam_dunks: 1
          }
        ]
      },
      away: {
        team_name: "Charlotte Hornets",
        colors: ["Turquoise", "Purple"],
        players: [
          {
            player_name: "Jeff Adrien",
            number: 4,
            shoe: 18,
            points: 10,
            rebounds: 1,
            assists: 1,
            steals: 2,
            blocks: 7,
            slam_dunks: 2
          },
          {
            player_name: "Bismack Biyombo",
            number: 0,
            shoe: 16,
            points: 12,
            rebounds: 4,
            assists: 7,
            steals: 22,
            blocks: 15,
            slam_dunks: 10
          },
          {
            player_name: "DeSagna Diop",
            number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5
          },
          {
            player_name: "Ben Gordon",
            number: 8,
            shoe: 15,
            points: 33,
            rebounds: 3,
            assists: 2,
            steals: 1,
            blocks: 1,
            slam_dunks: 0
          },
          {
            player_name: "Kemba Walker",
            number: 33,
            shoe: 15,
            points: 6,
            rebounds: 12,
            assists: 12,
            steals: 7,
            blocks: 5,
            slam_dunks: 12
          }
        ]
      }
    }
end

#takes an arg of players name and returns the number on points scored
def num_points_scored(player_search)
  game_hash.each do |team, team_info|
    #in the game_hash we iterate over the team hashes
    team_info[:players].each do |player|
      #when we are inside of team_info we want to access the players array of hashes,
      #iterating through each player
      if player[:player_name] == player_search
        #if the two compared is true do the following
        return player[:points]
      end
    end
  end
end



#Takes in an arg of players name and returns the shoe size for that player

def shoe_size(name)
  game_hash.each do|team, team_info|
    #in game_hash we iterate over the team hashes
    team_info[:players].each do |player|
      #when inside of team_info we want to access the players array of hashes,
      #iterating through each player
      if player[:player_name] == name
        #if the two compared is true do the following
        return player[:shoe]
      end
    end
  end
end



#takes an arg of the team name and returns an Array of team colors

def team_colors(team)
  if team == "Charlotte Hornets"
    #if the two compared is true do the following
    return game_hash[:away][:colors]
  else return game_hash[:home][:colors]
  end
end



#this method operates on the game hash to return an Array of team names

def team_names
  game_hash.map do |team, team_info|
    #inside of our game hash we will return a new array using .map
    team_info[:team_name]
    #inside of our array will be the team names
  end
end



#takes an arg of a team name and returns an Array of the jersey numbers for that team

def player_numbers(input)
  output = []
  #output is set to an empty array
  game_hash.each do |team, team_info|
    #in the game_hash we iterate through the team hashes
    if team_info[:team_name] == input
      #if the two compared are true
      team_info.each do |key, value|
        #iterate over the key value pairs
        if key == :players
          #if the two comapred are true
          value.each do |player|
            #iterate through each player
          output.push(player[:number])
          #push the player numbers into the empty array
          end
        end
      end
    end
  end
  return output
end



#takes in an arg of a players name and returns a hash of that players stats

def player_stats(input)
  game_hash.each do |team, team_info|
    #in the game hash we iterate through the team hashes
    team_info.each do |key, value|
      #iterate through the key value pairs
      if key == :players
        #if the two compared return true 
        value.each do |player|
          #iterate through the players
          if input == player[:player_name]
            #if the two compared return true
            return player
          end
        end
      end
    end
  end
end


#returns the number of rebounds associated with the player that has the largest shoe size
def big_shoe_rebounds
  big_shoe = 0
  #big shoe is set to 0
  rebounds = 0
  #rebounds is set to 0
  game_hash.each do |team, team_info|
    #in the game hash we iterate through the team hashes
    team_info[:players].each do |player|
      #iterate through each player
      if player[:shoe] > big_shoe
        #if the players shoe size if more than big_shoe
        big_shoe = player[:shoe]
        #the players shoe is set to big_shoe
        rebounds = player[:rebounds]
        #the players rebounds are set in rebounds
      end
    end
  end
  return rebounds
end
