Feature: Game Runner
  The game runner processes single-line commands and displays game state.

  Scenario: Move command moves player
    Given a running game with the player in room 1
    And the wumpus placed in room 3
    When the player enters "m 2" then "s 3"
    Then the output should contain room 2 status

  Scenario: Shoot coomand kills the wumpus
    Given a running game with the player in room 1
    And the wumpus placed in room 2
    When the player enter "s 2"
    Then the output should contain the killed wumpus message
    And the output should contain the you win message

  Scenario: Shoot through multiple rooms
    Given a running game witht he player in room 1
    And the wumpus placed in room 3
    When the player enter "s 2 3"
    Then the output should contain the killed wumpus message

  Scenario: Shoot with comma-separated rooms
    Given a running game with the player in room 1
    And the wumpus placed in room 3
    When the player enters "s 2,3"
    Then the output should contain the killed wumpus message

  Senario: Move into Wumpus room loses
    Given a running game with the player in room 1
    And the wumpus placed in room 2
    When the player eneter "m 2"
    Then the output should contain the eaten by wumpus message
    And the output should contain the you lose message

  Scenario: Move into pit loses
    Given a running game with the player in room 1
    And a pit placed in room 2
    When the player enters "m 2"
    Then the output should contain the fell in the pit message
    And the output should contain the you lose message

  Scenario: Invalid action shows error
    Given a running game with the player in room 1
    And the wumpus placed in room 2
    When the player eneters "x" then "s 2"
    Then the output should contain the invalid action message

  Scenario: Move to non-adjacent room shows error  
    Given a running game with the player in room 1
    And the wumpus placed in room 2
    When the player enters "m 10" then "s 2"
    Then the output contain the cant go there message

  Scenario: Move with bad number shows error
    Given a running game with the player in room 1
    And the wumpus placed in room 2 
    When the player enters "m abc" then "s 2"
    Then the output should containt the enter room number message

  Scenario: Shoot with bad number shows error 
    Given a running game with the player in room 1
    And the wumpus placed in room 2    
    When the player enters "s abc" then "s 2"
    Then the output should contain the enter room number message

  Scenario: Shoot with no rooms shows error 
    Given a running game with the player in room 1
    And the wumpus placed in room 2    
    When the player enters "s" then "s 2"
    Then the output should contain the shoot range message

   Scenario: Shoot with too many rooms shows error 
    Given a running game with the player in room 1
    And the wumpus placed in room 2    
    When the player enters "s 1 2 3 4 5 6" then "s 2"
    Then the output should contain the shoot range message   

  Scenario: Empty input is ignored
    Given a running game with the player in room 1
    And the wumpus placed in room 2    
    When the player enters "" then "s 2"
    Then the output should contain the killed wumpus message 
 
  Scenario: Game diplays title
    Given a running game with the player in room 1
    And the wumpus placed in room 2    
    When the player enters "s 2"
    Then the output should contain the title 

  Scenario: Game diplays warnings for adjacent hazards
    Given a running game with the player in room 1
    And the wumpus placed in room 2    
    When the player enters "s 2"
    Then the output should contain the smell wumpus warning

  Scenario: Game diplays arrow count
    Given a running game with the player in room 1
    And the wumpus placed in room 2    
    When the player enters "s 2"
    Then the output should show 5 arrows

  Scenario: Game diplays tunnel connections
    Given a running game with the player in room 1
    And the wumpus placed in room 2    
    When the player enters "s 2"
    Then the output should contain tunnels from room 1
  
  Scenario: Uppercase M commands works
    Given a running game with the player in room 1
    And the wumpus placed in room 3   
    When the player enters "M 2" then "s 3"
    Then the output should contain room 2 status

  Scenario: Uppercase S commands works
    Given a running game with the player in room 1
    And the wumpus placed in room 2   
    When the player enters "S 2"
    Then the output should contain the killed wumpus message    

  Scenario: Different languages produce different output
    Given a running game with the player in room 1
    And the wumpus placed in room 2   
    When the player enters "s 2"
    And the same game is run in "spanish" with input "s 2"
    Then the two output should differ