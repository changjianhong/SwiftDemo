//
//  JHSQLiteHelper.swift
//  MyMusic
//
//  Created by 常健洪 on 15/8/27.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit
import SQLite


//class JHSQLiteHelper: NSObject {
//   
//}

let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)

let author = Expression<String?>("author")
let title = Expression<String?>("title")
let pic_small = Expression<String?>("pic_small")


func createTable() {
    
    println("\(path)")
    
    let db = Database("\(path)/song.db")
    
    let songs = db["songs"]
    db.create(table: songs) { t in
        t.column(author)
        t.column(title)
//        t.column(email, unique: true)
    }
}


func insertData() {
    let db = Database("\(path)/to/db.sqlite3")
    let songs = db["songs"]

    songs.insert(author <- "常健洪", title <- "妈了个蛋的")

}

func queryData() {
    let db = Database("\(path)/to/db.sqlite3")
    let songs = db["songs"]
//    var alice: Query?
//    alice = songs.filter(<#condition: Expression<Bool>#>)
    
    for song in songs {
        println("\(song[author]),\(song[title])")
    }
    
}





