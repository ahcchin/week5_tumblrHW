//
//  TrendingViewController.swift
//  tumblrHW
//
//  Created by Andrew Chin on 9/6/14.
//  Copyright (c) 2014 Andrew Chin. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var feedImageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = feedImageView.frame.size
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
