//
//  ComposeViewController.swift
//  tumblrHW
//
//  Created by Andrew Chin on 9/6/14.
//  Copyright (c) 2014 Andrew Chin. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var textButton: UIButton!
    
    var buttonsArray: [UIButton]!
    
    var isPresenting: Bool! = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonsArray = [textButton, photoButton, quoteButton, linkButton, chatButton, videoButton]

        // Do any additional setup after loading the view.
    }
    
    //animation of the buttons
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        for buttons in buttonsArray {
            buttons.transform = CGAffineTransformMakeTranslation(0, view.frame.height)
        }
    }
//    buttons.frame.origin.x
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //spits out buttonsArray's index and value
        for (index, buttons) in enumerate(buttonsArray) {
            
            //casts delay into an NSTimerInterval, need to convert to CGFloat so it doesn't truncate when multiply with a double
            var delay = NSTimeInterval(CGFloat(index+1) * 0.05)
                        UIView.animateWithDuration(0.5, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 3, options: nil, animations: { () -> Void in
                            buttons.transform = CGAffineTransformIdentity
                        }, completion: { (Bool) -> Void in
            
                        })
            
            println("Item \(index + 1): \(buttons)")
        }
//        
//        for buttons in buttonsArray {
//            buttonsArray.c
//            
//            
//            UIView.animateWithDuration(0.5, delay: 2, usingSpringWithDamping: 0.7, initialSpringVelocity: 3, options: nil, animations: { () -> Void in
//                buttons.transform = CGAffineTransformIdentity
//            }, completion: { (Bool) -> Void in
//                
//            })
//        }
    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        modalPresentationStyle = UIModalPresentationStyle.Custom
        modalPresentationStyle = UIModalPresentationStyle.FullScreen
        
        //somehow the screen goes black if I use .Custom instead of .FullScreen
        transitioningDelegate = self
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning!{
        isPresenting = false
        return self
        
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning!) -> NSTimeInterval {
        return 0.4
    }
    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
    func animateTransition(transitionContext: UIViewControllerContextTransitioning!) {
        
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        if (isPresenting == true) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        }
    }
    

    
    @IBAction func onDismissTap(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        for (index, buttons) in enumerate(buttonsArray) {
            
            var delay = NSTimeInterval(CGFloat(index+1) * 0.2)
            
            UIView.animateWithDuration(0.5, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 3, options: nil, animations: { () -> Void in
                buttons.transform = CGAffineTransformMakeTranslation(0, -30)
                }, completion: { (completed: Bool) -> Void in
//                    self.super.viewWillDisappear(animated)
                    //can't called this in the block
            })
            
            
            super.viewWillDisappear(animated)
        }
        
    }
    

    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }


}