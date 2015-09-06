//
//  JHCollectionViewLayout.swift
//  Swift-03-2
//
//  Created by 常健洪 on 15/7/25.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class JHCollectionViewLayout: UICollectionViewFlowLayout {
   
    override func prepareLayout() {
        
        let itemSize = CGSizeMake(itemWidth,itemHeight)
        
        self.itemSize = itemSize
        
        self.minimumInteritemSpacing = 0.0
        
        self.minimumLineSpacing = 0
        
//        self.scrollDirection = UICollectionViewScrollDirection.Horizontal
  
    }
    
}
