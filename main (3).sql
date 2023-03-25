--  Data exploration of a college football players data set.

  SELECT * FROM benn.college_football_players;
  
  -- I want to see the number of player for each year group. 
  
  SELECT distinct(count(year)) as number_of_player,
  case when year ='FR' then 'FR' 
  when year = 'SO' then 'SO'
  when year = 'JR' then 'JR'
  when year = 'SR' then 'SR'
  else null end as year_group
  FROM benn.college_football_players
  group by year
  
  -- 9665	FR, 5881	SO, 5665	JR, 5087	SR
  
  -- I want to know how many player of each year is equal to or greater 72inches
  
  SELECT 
 COUNT(CASE WHEN year ='FR' AND height >=72 THEN 1 ELSE NULL END) as FR_equal_to_or_greater_72in,
  COUNT(CASE WHEN year = 'SO' AND height >=72 THEN 1 ELSE NULL END) AS SO_equal_to_or_greater_72in,
       COUNT(CASE WHEN year = 'JR' AND height >= 72 THEN 1 ELSE NULL END) AS JR_equal_to_or_greater_72in,
       COUNT(CASE WHEN year = 'SR' AND height >= 72  THEN 1 ELSE NULL END) AS SR_equal_to_or_greater_72in
  FROM benn.college_football_players
  
  -- FOR FR 7264, FOR SO 4282, FOR JR 4193, FOR SR 3710,  
  --The freshmen have the highest number of player that are equal to or greater 6 feet while the senior has the least amont of players equal to or greater 6 feet.
  
  -- I want to know the top 3 state with the highest number of players 
  
  SELECT state, COUNT(*) as count
FROM benn.college_football_players
GROUP BY state
ORDER BY count DESC
limit 3;

-- TX, FL, CA

-- Now I'm going to join two tables together 

SELECT * FROM benn.college_football_players;

SELECT * FROM benn.college_football_teams;

SELECT players.player_name, teams.school_name, players.year 
FROM benn.college_football_players players
INNER JOIN benn.college_football_teams teams
ON players.school_name = teams.school_name

-- I was able to join both table by school_name  colume they share 

-- I would like to query playername, schoolname, player year and conference for 'FCS (Division I-AA Teams)' and another query for the  'FBS (Division I-A Teams)'
SELECT players.player_name,
       players.school_name,
       players.year,
       teams.conference
  FROM benn.college_football_players players
 INNER JOIN benn.college_football_teams teams
    ON teams.school_name = players.school_name
 WHERE teams.division = 'FCS (Division I-AA Teams)'
 
SELECT players.player_name,
       players.school_name,
       players.year,
       teams.conference
  FROM benn.college_football_players players
 INNER JOIN benn.college_football_teams teams
    ON teams.school_name = players.school_name
 WHERE teams.division = 'FBS (Division I-A Teams)'
 
 --I use inner join to make a list of playername, schoolname, player year and conference for 'FCS (Division I-AA Teams)' and another query for the  'FBS (Division I-A Teams)' 
 --Which show each player and there respective  divison. 