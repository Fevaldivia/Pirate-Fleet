//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(_ human: Human) {
        // Write your code here!
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 0, y: 1), isVertical: true)
        let smallShip = Ship(length: 2, location: GridLocation(x: 3, y: 2), isVertical: true)
        let largeShip = Ship(length: 4, location: GridLocation(x: 0, y: 7), isVertical: false)
        let xLargeShip = Ship(length: 5, location: GridLocation(x: 7, y: 2), isVertical: true)
        // Adding mines to the game
        let mine1 = Mine(location: GridLocation(x: 5, y: 6), explosionText: "BOOM !")
        let mine2 = Mine(location: GridLocation(x: 3, y: 1), explosionText: "YOU ARE DEAD !")
        
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
        
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(smallShip)
        human.addShipToGrid(largeShip)
        human.addShipToGrid(xLargeShip)
    }
    
    func calculateFinalScore(_ gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        let enemyShipSunks = gameStats.enemyShipsRemaining + gameStats.numberOfHitsOnEnemy
        
        let humanShipRemaining = gameStats.humanShipsSunk + gameStats.numberOfMissesByHuman
        
        let numberOfGuesses = gameStats.numberOfMissesByHuman + gameStats.numberOfHitsOnEnemy
        
        finalScore = (enemyShipSunks * gameStats.sinkBonus) + (humanShipRemaining * gameStats.shipBonus) - (numberOfGuesses * gameStats.guessPenalty)
        
        
        
        return finalScore
    }
}
