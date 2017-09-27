//
//  Game+Convience.swift
//  GamePlayerApp
//
//  Created by Mitch Praag on 7/20/17.
//  Copyright © 2017 Mitch Praag. All rights reserved.
//

import Foundation
import CoreData

extension Game {
    convenience init (name: String, date: Date = Date(), in context:NSManagedObjectContext ) {
        
        self.init(context:context)
        
        self.name = name
        self.datePlayed = date as NSDate
    }
}
