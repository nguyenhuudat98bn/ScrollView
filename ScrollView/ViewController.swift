//
//  ViewController.swift
//  ScrollView
//
//  Created by nguyễn hữu đạt on 5/21/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        imageView = UIImageView(image:#imageLiteral(resourceName: "rose") )
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = UIColor.black
        scrollView.contentSize = imageView.bounds.size
        scrollView.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue)))
        
        scrollView.contentOffset = CGPoint(x: 1000, y: 450)
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 4.0
        scrollView.zoomScale = 1.0

        return imageView
    }
    func setZoomScale() {
        let imageViewSize = imageView.bounds.size
        let scrollViewSize = scrollView.bounds.size
        let widthScale = scrollViewSize.width / imageViewSize.width
        let heightScale = scrollViewSize.height / imageViewSize.height
        
        scrollView.minimumZoomScale = min(widthScale, heightScale)
        scrollView.zoomScale = 1.0
    }

}

