//
//  SearchViewController.swift
//  tumblrHW
//
//  Created by Andrew Chin on 9/6/14.
//  Copyright (c) 2014 Andrew Chin. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var loading1ImageView: UIImageView!
    @IBOutlet weak var loading2ImageView: UIImageView!
    @IBOutlet weak var loading3ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        

        // Do any additional setup after loading the view.
    }

    
    override func viewDidAppear(animated: Bool) {
        println("view will appear gets called")
        super.viewDidAppear(animated)
        
        feedImageView.alpha = 0
        loading2ImageView.alpha = 0
        loading3ImageView.alpha = 0
//        
//        UIView.animateWithDuration(2, animations: {
//            self.feedImageView.alpha  = 1
//        })

        UIView.animateWithDuration(0.5, animations: {
            self.loading1ImageView.alpha = 0
            self.loading2ImageView.alpha = 1
            println("animation block run")
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.5, animations: {
                    self.loading2ImageView.alpha = 0
                    self.loading3ImageView.alpha = 1
                    }, completion: { (Bool) -> Void in
                        self.loading3ImageView.alpha = 0
                        UIView.animateWithDuration(0.4, animations: { () -> Void in
                            self.feedImageView.alpha = 1
                        })
    
                        
                })
        }
        
        
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
