//
//  GameController.swift
//  GamePlayerApp
//
//  Created by Mitch Praag on 7/20/17.
//  Copyright © 2017 Mitch Praag. All rights reserved.
//

import Foundation
import CoreData


class GameController {
    static let shared = GameController()
    
    var games: [Game] {
        let fetchRequest: NSFetchRequest<Game> = Game.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "dateLastPlayed", ascending: true)]
        var results = [Game]()
        
        container.viewContext.performAndWait {
            do {
                results = try fetchRequest.execute()
            } catch {
                NSLog("error fetching games: \(error)")
            }
        }
        return results
    }
    
    private let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { (description: NSPersistentStoreDescription, error: Error?) in if let error = error {
            NSLog("error loading persisten stores: \(error)")
            }
        }
    }
    
    func createGame(name: String, date: Date = Date()) -> Game {
        let game = Game(name: name, date: date, in: container.viewContext)
        save()
        return game
    }
    
    func save() {
            do {
                try container.viewContext.save()
            } catch {
                NSLog("error saving managed object context: \(error)")
        }
        
        }
    
    func delete(game: Game) {
        container.viewContext.delete(game)
        save()
    }
    
    func createPlayer(name: String, score: Int64 = 0, game: Game? = nil) -> Player {
        let player = Player(name: name, score: score, game:game, in: container.viewContext)
        save()
        return player
    }
    
    func deletePlayer(_ player: Player) {
        container.viewContext.delete(player)
        save()
    }
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

