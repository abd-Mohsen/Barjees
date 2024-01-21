# Barsis Board Game

This repository contains the source code for a board game called Barsis, developed using Flutter framework and Dart language.

## Game Description

Barsis is a two-player board game where the objective is to get all four of your stones to the middle of the board before your opponent does. The game can be played either against another player or against the computer.

### Game Rules

- Each player starts with four stones.
- Players take turns throwing shells and counting how many shells are closed.
- The number of shells opened determines the value of the throw and whether the player gets to throw again.
- The player who reaches the middle of the board with all four stones first wins the game.
- you can eliminate opponent stones if your stone lands exactly on the same cell. unless its a castle cell (marked with an X).

For more detailed game rules, please refer to [this file](assignment.pdf).

## Computer AI

The computer opponent in Barsis has three difficulty levels:

1. **Easy**: The computer plays randomly, without any strategic decision-making.
2. **Medium**: The computer generates all possible next states for it and evaluates them using an evaluation function. It then chooses the best 
   state to play based on this evaluation.
3. **Hard**: The computer uses the minimax algorithm (specifically, the expectiminimax variant) to predict all possible states by considering the worst-case scenario for its opponent (the player). It then selects the move that leads to the best outcome for itself.


This game was developed as an assignment for a course at [Damascus University]. The assignment aimed to demonstrate proficiency in implementing state 
space search algorithms and simple game logic.

Feel free to explore the source code and contribute to the project if you'd like!



