//
//  ViewController.swift
//  bossreferesh
//
//  Created by lotawei on 16/9/11.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    
    var   tableview:UITableView!
    var   re:RefreshAnimationView!
    var   lastoffsety:CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
       re = RefreshAnimationView(frame:CGRectMake(100,200,50,80))
        re.center = self.view.center
        view.addSubview(re)
        
        //演示简单加个tableview
        tableview = UITableView.init(frame: CGRectMake(0, 0, 200, 150), style: .Plain)
        tableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.delegate = self
        tableview.dataSource = self
        view.addSubview(tableview)
        tableview.backgroundColor = UIColor.yellowColor()
        
        tableview.center = re.center
        tableview.frame.origin.y = re.center.y +  90
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return  1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return   6
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var   cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if  cell == nil
        {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = "数据"
        return  cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        
        
        if scrollView.contentOffset.y < 0  {
            let ar = -scrollView.contentOffset.y
            re.currentvalue = ar/5
           
           
            if lastoffsety > -scrollView.contentOffset.y {
                re.center.y -= ar/50
            }
            else
            {
                re.center.y += ar/50
            }
             lastoffsety = -scrollView.contentOffset.y
        }
        else  if  scrollView.contentOffset.y == 0
        {
             re.currentvalue = 0
            re.center  = self.view.center
        }
        
    }

}

