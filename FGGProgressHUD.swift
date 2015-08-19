//
//  FGGProgressHUD.swift
//  Swift_Practise
//
//  Created by 夏桂峰 on 15/8/19.
//  Copyright (c) 2015年 夏桂峰. All rights reserved.
//
/*
------------------------------------------------------------------------
FGGProgressHUD用法简介：
==>下载数据的时候显示：FGGProgressHUD().showLoadingOnView(aView:self.view)
显示后界面显示loading画面和UIActivityIndicator，同时状态栏显示网络活动指示器。
==>下载完或下载失败关闭：FGGProgressHUD()hideFromView(aView:self.view)
------------------------------------------------------------------------
*/
import UIKit

func RBGA(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat)->UIColor{
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

class FGGProgressHUD: UILabel {
    
    func showLoadingOnView(#aView:UIView){
        UIApplication.sharedApplication().networkActivityIndicatorVisible=true
        var xpos=aView.frame.size.width/2.0-80.0
        var ypos=aView.frame.size.height/2;
        var loadingView=FGGProgressHUD(frame: CGRectMake(xpos, ypos, 160, 60))
        loadingView.backgroundColor=RBGA(71, 71, 71, 0.3)
        loadingView.layer.cornerRadius=6
        loadingView.clipsToBounds=true
        loadingView.text="    Loading..."
        loadingView.textColor=UIColor.whiteColor()
        loadingView.textAlignment=NSTextAlignment.Center
        loadingView.font=UIFont.systemFontOfSize(20)
        
        var indicator=UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
        indicator.startAnimating()
        indicator.frame=CGRectMake(10, 15, 30, 30)
        loadingView.addSubview(indicator)
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            aView.addSubview(loadingView)
        })
    }
    func hideFromView(#aView:UIView){
        UIApplication.sharedApplication().networkActivityIndicatorVisible=false
        for(var i=0;i<aView.subviews.count;i++){
            var sub: UIView=aView.subviews[i] as! UIView
            if sub.isKindOfClass(FGGProgressHUD){
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    sub.removeFromSuperview()
                })
            }
        }
    }
}