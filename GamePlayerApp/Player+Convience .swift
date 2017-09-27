//
//  Player+Convience .swift
//  GamePlayerApp
//
//  Created by Mitch Praag on 7/20/17.
//  Copyright © 2017 Mitch Praag. All rights reserved.
//

import Foundation
import CoreData

extension Player {
    convenience init(name: String, score: Int64 = 0, game: Game? = nil, in context:NSManagedObjectContext) {
        self.init(context:context)
        
        self.name = name
        self.score = score
        self.game = game
    }
    
}
