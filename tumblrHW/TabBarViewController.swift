//
//  TabBarViewController.swift
//  tumblrHW
//
//  Created by Andrew Chin on 9/6/14.
//  Copyright (c) 2014 Andrew Chin. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    var homeViewController: HomeViewController!
    var searchViewController: SearchViewController!
    var composeViewController: ComposeViewController!
    var accountViewController: AccountViewController!
    var trendingViewController: TrendingViewController!
    var previousButton: UIButton!
    var previousViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //access the storyboard so we can instantiate the view controllers we've created
        var storyboard = UIStoryboard(name: "Main", bundle: nil)

        //programmatically creating these view controllers, we only need to do this once
        //these need to be defined in the storyboard ID!!
    
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as HomeViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as SearchViewController
//        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as ComposeViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as AccountViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as TrendingViewController
        
        searchViewController.view.frame = contentView.frame
        contentView.addSubview(searchViewController.view)
        previousViewController = searchViewController
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    @IBAction func onTabButtonPressed(sender: AnyObject) {
        
        var button = sender as UIButton

        //to track previous Button so you can deselect it

        println("Button: \(button.tag) was tapped")

        if (previousButton == nil) {
            previousButton = button
        }
        
        if (button.tag == 0){
            //home
            homeViewController.view.frame = contentView.frame
            contentView.addSubview(homeViewController.view)
            self.addChildViewController(homeViewController)
            previousViewController.removeFromParentViewController()
            previousViewController = homeViewController

            
            button.selected = true
            previousButton.selected = false
            previousButton = button  //updating now to be previous button
            

        }
        else if (button.tag == 1) {
            
            
            //search
            searchViewController.view.frame = contentView.frame
            contentView.addSubview(searchViewController.view)
            self.addChildViewController(searchViewController)
            previousViewController.removeFromParentViewController()
            previousViewController = searchViewController
            
            button.selected = true
            previousButton.selected = false
            previousButton = button  //updating now to be previous button
            
        } else if (button.tag == 2) {
            //compose
            performSegueWithIdentifier("ComposeSegue", sender: self)


        } else if (button.tag == 3) {
            //account
            accountViewController.view.frame = contentView.frame
            contentView.addSubview(accountViewController.view)
            
            self.addChildViewController(accountViewController)
            previousViewController.removeFromParentViewController()
            previousViewController = accountViewController
            
            
            button.selected = true
            previousButton.selected = false
            previousButton = button  //updating now to be previous button
            
        } else if (button.tag == 4) {
            //trending
            trendingViewController.view.frame = contentView.frame
            contentView.addSubview(trendingViewController.view)
            self.addChildViewController(trendingViewController)
            previousViewController.removeFromParentViewController()
            previousViewController = trendingViewController
            
            button.selected = true
            previousButton.selected = false
            previousButton = button  //updating now to be previous button

        }
        
        
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
