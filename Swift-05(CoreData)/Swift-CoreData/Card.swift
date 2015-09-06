//
//  Card.swift
//  Swift-CoreData
//
//  Created by 常健洪 on 15/7/31.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import Foundation
import CoreData

class Card: NSManagedObject {

    @NSManaged var no: String
    @NSManaged var person: Person

}
