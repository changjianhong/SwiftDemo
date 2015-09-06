//
//  Person.swift
//  Swift-CoreData
//
//  Created by 常健洪 on 15/7/31.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import Foundation
import CoreData

class Person: NSManagedObject {

    @NSManaged var age: NSNumber
    @NSManaged var name: String
    @NSManaged var card: Card

}
