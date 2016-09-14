//
//  RefreshAnimationView.swift
//  bossreferesh
//
//  Created by lotawei on 16/9/11.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

class RefreshAnimationView: UIView {
    
    
    
    
    var    currentvalue:CGFloat = 0  {
        didSet{
            
           self.setNeedsDisplay()
            print(currentvalue)
        }
    }
    var   ori:CGPoint!
    var  benginangle:CGFloat = CGFloat.init(-M_PI)
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor =  UIColor.whiteColor()
        let     w = frame.size.height > frame.size.width  ? frame.size.height:frame.size.width
        self.frame.size  = CGSizeMake(w, w)
        ori  = frame.origin
    }
    
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        let   ref = UIGraphicsGetCurrentContext()
        
        
        drawmorearc(ref!,currentv: currentvalue,begin:CGFloat(-M_PI))
        
        
        
    }
   
    func drawmorearc(ref:CGContext,currentv:CGFloat,begin:CGFloat)  {
        CGContextSetRGBStrokeColor(ref, 0, 0, 1, 1)
        CGContextSetLineWidth(ref, 5)
        benginangle = CGFloat.init(begin+currentv)
        CGContextAddArc(ref, frame.size.width/2, frame.size.height/2, frame.size.height/2-5, begin, CGFloat.init(begin+currentv), 0)
        
        CGContextStrokePath(ref)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
