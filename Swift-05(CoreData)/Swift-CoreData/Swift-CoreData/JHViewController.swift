//
//  JHViewController.swift
//  Swift-CoreData
//
//  Created by 常健洪 on 15/7/31.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit
import CoreData
@objc(Person)

class JHViewController: UIViewController {
    
    var context:NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContext()
//        self.view.backgroundColor = UIColor.whiteColor()
        insertData("chang", age: NSNumber(int: 2), no:"s")
        queryData()
    }
    
    
    func setupContext(){
        
        //模型文件
        var modelUrl = NSBundle.mainBundle().URLForResource("Model", withExtension: "momd")!
        var model = NSManagedObjectModel(contentsOfURL: modelUrl)!
        
        //传入模型文件 初始化
        var psc = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        let fileManager = NSFileManager.defaultManager()
        var directoryURL = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as! NSURL
        var sqlUrl = directoryURL.URLByAppendingPathComponent("model.sqlite")
        
        //持久化数据库 - 模型
        var error:NSError?
        var store:NSPersistentStore = psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: sqlUrl, options: nil, error: &error)!
        
        if let obj = error {
//            NSException.raise("添加数据库错误", format: error?.localizedDescription, arguments:nil)
        }
        
        //上下文
        var context = NSManagedObjectContext()
        self.context = context;
        context.persistentStoreCoordinator = psc
        
    }

    /**
    插入数据
    
    :param: name person.name
    :param: age  person.age
    :param: no   card.no
    */
    func insertData(name:String, age:NSNumber, no:String){
        var context = self.context
        
        //传入上下文, 创建实体对象
        var person = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: context) as! Person
        person.setValue(name, forKey: "name")
        person.setValue(age, forKey: "age")
        
        var card = NSEntityDescription.insertNewObjectForEntityForName("Card", inManagedObjectContext: context)as!Card
        card.setValue(no, forKey: "no")
        
        //创建person card之间的关联
        person.setValue(card, forKey: "card")
        
        var error:NSError?
        var isSucceed:Bool  = context.save(&error)
        
        if !isSucceed {
//            NSException.raise("数据保存错误", format: error?.localizedDescription, arguments:nil)
        }
        
    }
    
    /**
    查询数据
    */
    func queryData() {
        var context = self.context
        
        //初始化查询请求
        var request = NSFetchRequest()
        
        //要查询的实体
        request.entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: context)
        
        //排序
        var sort = NSSortDescriptor(key: "age", ascending:false)
        request.sortDescriptors = [sort]
        
        //条件
        
        var format = "name like %@"
        var predicate = NSPredicate(format: format, "*chang*")
        request.predicate = predicate
        
        var error:NSError?
        var objs = context.executeFetchRequest(request, error: &error) as![NSManagedObject]
        
//        if let e = error {
//            
////            NSException.raise("查询数据错误", format: "%@", arguments: error?.localizedDescription)
////            NSException.raise(<#name: String#>, format: <#String#>, arguments: <#CVaListPointer#>)
//        }
        
        for o in objs {
            var obj = o as NSManagedObject
            var name = obj.valueForKey("name") as! String
            println(name)
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
