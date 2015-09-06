//
//  JHBaseController.swift
//  MyVedio
//
//  Created by 常健洪 on 15/8/20.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit
import Kingfisher
import SDWebImage
import SnapKit

class JHBaseController: UIViewController,UIScrollViewDelegate {

    let kScrollViewWidth = UIScreen.mainScreen().bounds.width - 140
    let kScrollViewHeight:CGFloat = 200
    let minTinderScale:CGFloat = 0.7
    let maxTinderScale:CGFloat = 1.0
    let imageStr = "https://ss1.baidu.com/9vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=122076746d600c33f02c8d887c71653d/eac4b74543a98226b6bf9e478c82b9014a90eb50.jpg"
    
    var imageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor.whiteColor()
        
        imageView = UIImageView()
        self.view.addSubview(imageView)
        
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        imageView.snp_makeConstraints { (make) -> Void in
            
            make.top.equalTo(self.view).offset(300)
            
            make.centerX.equalTo(self.view)
            
            make.size.equalTo(self.view).multipliedBy(0.5)
            
        }
        
        // autoLayout 下 才能好用
        imageView.kf_showIndicatorWhenLoading = true
        
        imageView.kf_setImageWithURL(NSURL(string: imageStr)!)

        imageView.backgroundColor = UIColor.grayColor()
        
        headScrollView()
    }
    
    func headScrollView() {
        
        var scrollView = UIScrollView()
        scrollView.backgroundColor                = UIColor.grayColor()
        scrollView.clipsToBounds                  = false
        scrollView.pagingEnabled                  = true
        scrollView.showsVerticalScrollIndicator   = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate                       = self
        scrollView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(scrollView)
        
        scrollView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.view).offset(70)
            make.right.equalTo(self.view).offset(-70)
            make.top.equalTo(self.view)
            make.height.equalTo(kScrollViewHeight)
        }
        
        scrollView.contentSize = CGSizeMake(kScrollViewWidth * 10, 0)
        
        for i in 0...9 {
            
/// 由于要在添加完毕后直接判断view的centerX，在autoLayout下，得到的centerX都是0 只能在滑动以后才能得到frame，所以就手写frame值添加到scrollView中
            
//            var view = JHView()
//            view.backgroundColor = UIColor.redColor()
//            scrollView.addSubview(view)
//            view.setTranslatesAutoresizingMaskIntoConstraints(false)
//            view.snp_makeConstraints({ (make) -> Void in
//                make.size.equalTo(scrollView)
//                make.left.equalTo(scrollView).offset(Float(kScrollViewWidth) * Float(i))
//                make.top.equalTo(scrollView)
//            })
//
//            
//            var subView = UIImageView()
//            subView.kf_showIndicatorWhenLoading = true
//            subView.kf_setImageWithURL(NSURL(string: imageStr)!)
//            subView.contentMode = UIViewContentMode.ScaleAspectFit
//            view.addSubview(subView)
//            subView.setTranslatesAutoresizingMaskIntoConstraints(false)
//            subView.snp_makeConstraints({ (make) -> Void in
//                make.edges.equalTo(view).insets(UIEdgeInsetsMake(0, 10, 0, 10))
//            })
            
            var view = JHView(frame:CGRectMake(CGFloat(CGFloat(i) * kScrollViewWidth), 0, kScrollViewWidth, kScrollViewHeight))
            view.backgroundColor = UIColor.redColor()
            scrollView.addSubview(view)
            
            var subView = UIImageView(frame: CGRectInset(view.bounds, 10, 10))
            subView.kf_showIndicatorWhenLoading = true
            subView.kf_setImageWithURL(NSURL(string: imageStr)!, placeholderImage: UIImage(named: "IMG_0249.jpg"))
            view.addSubview(subView)
        }
        configScale(scrollView)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        configScale(scrollView)
    }
    
    func configScale(scrollView:UIScrollView){
        
        for (index,value) in enumerate(scrollView.subviews as! [JHView]) {
            
            let iv = value as JHView
            
            var percent:CGFloat = fabs((iv.center.x - (scrollView.contentOffset.x+kScrollViewWidth/2))/kScrollViewWidth)
            
/// 由于采用的是scrollView -> View -> UIImageView 的方式,所以不能直接用x去判断
//            var percent:CGFloat = fabs((iv.frame.origin.x - (scrollView.contentOffset.x))/kScrollViewWidth)

            percent = percent > 1 ? 1 : percent
            
            var scale = self.maxTinderScale - (self.maxTinderScale-self.minTinderScale) * percent
            iv.transform = CGAffineTransformMakeScale(scale, scale)
        }
    }
}





