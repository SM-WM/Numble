# Numble

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Numble is a number game where the player needs to guess a 4 digit number in multiple attempts. After each attempt, the number of green and yellow tiles will be revealed to show how close the attempt was to the solution. The player will get a performance score which depends on the number of attempts and time the player took to guess the correct number.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Game
- **Mobile:** The app will be primarily developed for mobile but will be just as viable on a computer.
- **Story:** A new number will be updated daily, and users can maintain a winning streak. They will also be able to view their previous scores and their postition in the leaderboard.
- **Market:** Any individual could choose to play the game.
- **Habit:** This app could be incorporated into people's daily routines
- **Scope:** App wil mainly start as simply daily challenges, but we might explore multi-player competitive paradigms. By providing ranks and a social sharing feature we will promote competition among players.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

[X] User sees the instruction page on the first launch of app
[X] A new challenge is presented after every game
[X] A timer counts the time taken between the first guess and the correct guess
* User is given a performance score based on number of tries and time taken
* progress is saved across sessions including time countdowns

**Optional Nice-to-have Stories**

* User is able to share the results with others
* User is able to view their position in the leaderboard 
* multiplayer mode enables two player to play at the same time concurrently
* outside daily challenges, user can play practice rounds
* user can switch between three levels of difficulty

### 2. Screen Archetypes

* Game Page
   * The main page, where daily challenges are presented and timer is shown
 
* Leaderboard
   * performace score history and leaderboard is shown, and user can share results with others

* Settings
   * user can change the level of difficulty of the game(3 digit number, 4 digit number, 5 digit number)

* Instructions
   * instructions on how to play the game is shown

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Game Page!

* Leaderboard

**Flow Navigation** (Screen to Screen)

* Instruciton page -> presented at the initial app launch and toggled in the future when needed
* Settings -> Toggle settings
 

## Wireframes
<img src="https://user-images.githubusercontent.com/71288177/163115890-77ebc176-4bf6-49a5-bc1e-b045c18f73a4.jpeg" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
