//
//  ViewController.swift
//  HorizontalParallaxScrollView
//
//  Created by 林彥辰 on 2014/10/16.
//  Copyright (c) 2014年 iTaoyuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    let MAX_BACKGROUND_SCROLL_DISTANCE: CGFloat = 150
    //let SIDE_BAR_WIDTH: CGFloat = 20
    @IBOutlet var scrollView: UIScrollView!
    
    var pageView1 = UIScrollView()
    var pageView2 = UIScrollView()
    var pageView3 = UIScrollView()
    
    var backgroundImageView1 = UIImageView()
    var backgroundImageView2 = UIImageView()
    var backgroundImageView3 = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var numberOfPages: CGFloat = 3
        var i: CGFloat = 0
        
        
        self.scrollView.pagingEnabled = true
        self.scrollView.frame = CGRectMake(0, 0, self.scrollView.frame.width, self.scrollView.frame.height)
        self.scrollView.contentSize = CGSize(width: scrollView.frame.width * numberOfPages, height: scrollView.frame.height)
        
        self.setPageView()
        
        
    }
    
    func setPageView() {
        
        pageView1.contentSize = CGSize(width: scrollView.frame.width + 2*MAX_BACKGROUND_SCROLL_DISTANCE, height: scrollView.frame.height)
        pageView1.frame = CGRectMake(0, 0, self.scrollView.frame.width, self.scrollView.frame.height)
        pageView1.setContentOffset(CGPointMake(MAX_BACKGROUND_SCROLL_DISTANCE, 0), animated: false)
        self.pageView1.userInteractionEnabled = false
        self.scrollView.addSubview(pageView1)
        
        
        pageView2.contentSize = CGSize(width: scrollView.frame.width + 2*MAX_BACKGROUND_SCROLL_DISTANCE, height: scrollView.frame.height)
        pageView2.frame = CGRectMake(self.scrollView.frame.width, 0, self.scrollView.frame.width, self.scrollView.frame.height)
        pageView2.setContentOffset(CGPointMake(MAX_BACKGROUND_SCROLL_DISTANCE, 0), animated: false)
        self.pageView2.userInteractionEnabled = false
        self.scrollView.addSubview(pageView2)
        
        pageView3.contentSize = CGSize(width: scrollView.frame.width + 2*MAX_BACKGROUND_SCROLL_DISTANCE, height: scrollView.frame.height)
        pageView3.frame = CGRectMake(self.scrollView.frame.width*2, 0, self.scrollView.frame.width, self.scrollView.frame.height)
        pageView3.setContentOffset(CGPointMake(MAX_BACKGROUND_SCROLL_DISTANCE, 0), animated: false)
        self.pageView3.userInteractionEnabled = false
        self.scrollView.addSubview(pageView3)
        
        self.setBackgroundImageView()
    }
    
    func setBackgroundImageView() {
        
        backgroundImageView1.image = UIImage(named: "page1")
        backgroundImageView1.frame = CGRectMake(MAX_BACKGROUND_SCROLL_DISTANCE, 0, self.scrollView.frame.width, self.scrollView.frame.height)
        self.pageView1.addSubview(backgroundImageView1)
        
        
        backgroundImageView2.image = UIImage(named: "page2")
        backgroundImageView2.frame = CGRectMake(MAX_BACKGROUND_SCROLL_DISTANCE, 0, self.scrollView.frame.width, self.scrollView.frame.height)
        self.pageView2.addSubview(backgroundImageView2)
        
        
        backgroundImageView3.image = UIImage(named: "page3")
        backgroundImageView3.frame = CGRectMake(MAX_BACKGROUND_SCROLL_DISTANCE, 0, self.scrollView.frame.width, self.scrollView.frame.height)
        self.pageView3.addSubview(backgroundImageView3)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var ratio = self.scrollView.contentOffset.x / self.scrollView.frame.width
        if ratio > -1 && ratio < 1 {
            self.pageView1.setContentOffset(CGPointMake(MAX_BACKGROUND_SCROLL_DISTANCE - ratio*MAX_BACKGROUND_SCROLL_DISTANCE, 0), animated: false)
        }
        if ratio > 0 && ratio < 2 {
            self.pageView2.setContentOffset(CGPointMake(MAX_BACKGROUND_SCROLL_DISTANCE - (ratio-1)*MAX_BACKGROUND_SCROLL_DISTANCE, 0), animated: false)
        }
        if ratio > 1 && ratio < 3 {
            self.pageView3.setContentOffset(CGPointMake(MAX_BACKGROUND_SCROLL_DISTANCE - (ratio-2)*MAX_BACKGROUND_SCROLL_DISTANCE, 0), animated: false)
        }
        print("\(ratio)\n")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

