# mips_bot
This was a class project for CS233
It was a programming contest where you had to control virtual robots using MIPS code only.
Two robots competed in an arena with some obstacles, to paint as many tiles as they could.
Additionally, powerups can be collected from random spawn points on the map to help paint tiles.
Each robot obtains more paint by completing a puzzle. The puzzle is just a 5x5 skyscraper puzzle. 


After grinding out MIPS instructions for and staying caffienated for a week straight, we came up
with a robot that won 4th and we got an A.
I had one teammate. I worked on the robot's code and my teammate worked on profiling the existing MIPS code to make it run faster.
The code optimization was useful because it allowed us to solve paint puzzles faster which gives us more paint.

Our strategy was like this:
  Path to each randomly spawned powerup and paint any tile that has no paint.
  The robot's position is represented as floating point coordinates.
  Our path finding algorithm works like this:
    First it tries to travel directly to the target location.
    When it bumps into an obstacle, it turns perpendicular to the surface of the obstacle and moves straight.
    If this gets it around the obstacle, it will continue to head directly to the target.
    If not, it will bump into the obstacle again and continue moving perpenicular to the obstacle.
    After a certain number of bumps, it will then try turning perpendicular in the other direction, 
    this helps it get around tough obstacles so it doesn't get stuck.
    
10/10 great time
