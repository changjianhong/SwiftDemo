//
//  JHCollectionViewController.swift
//  Swift-03-2
//
//  Created by 常健洪 on 15/7/25.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

let itemHeight: CGFloat = 200.0
// Cell 的高度

let itemWidth: CGFloat = 75
// Cell 的宽度

let collectionViewWidth = itemWidth * 3
//同时显示三个 Cell 时候


let reuseIdentifier = "Cell"

class JHCollectionViewController: UICollectionViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.registerClass(JHCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        self.navigationController!.delegate = self
        
        self.collectionView?.backgroundColor = UIColor.whiteColor()
    }


    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 10
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> JHCollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! JHCollectionViewCell
        
        cell.labelText = "二零一五 年"
        cell.textInt = 2015
    
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.blueColor()
        self.navigationController!.pushViewController(vc, animated:true)
        
    }
    
    
}


// MARK: - 扩展(category) :遵守的协议
extension JHCollectionViewController:UINavigationControllerDelegate{
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        var animation = JHAnimationTransitioning()
        animation.operation = operation
        return animation
        
    }
    
}























