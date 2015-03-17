//
//  SettingsModalViewController.swift
//  alarm
//
//  Created by Kevin Farst on 3/15/15.
//  Copyright (c) 2015 Kevin Farst. All rights reserved.
//

import UIKit

class SettingsModalViewController: UIViewController {
  
  @IBAction func moveModal(sender: UIPanGestureRecognizer) {
    let velocity = sender.velocityInView(self.view)
    
    switch sender.state {
    case .Changed:
        let translation = sender.translationInView(self.view)
        let newPosition = CGFloat(sender.view!.center.y + translation.y)

        if newPosition > openPosition && newPosition < closedPosition {
          sender.view!.center.y = newPosition
          sender.setTranslation(CGPointZero, inView: self.view)
        }
    case .Ended:
      let damping: CGFloat! = 0.8
      let initVelocity: CGFloat! = 1.6
      
      if velocity.y < 0 {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: initVelocity, options: .CurveEaseInOut, animations: { () -> Void in
            self.view.center.y = self.openPosition
        }, completion: { finished in
          if finished {
            self.open = true
          }
        })
      } else if velocity.y > 0 {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: initVelocity, options: .CurveEaseInOut, animations: { () -> Void in
            self.view.center.y = self.closedPosition
        }, completion: { finished in
          if finished {
            self.open = false
          }
        })
      }
      break
    default:
      break
    }
  }
  
  @IBAction func alarmToggled(sender: UISwitch) {
  }
  
  @IBOutlet weak var alarmSwitch: UISwitch!
  
  var openPosition: CGFloat!
  var closedPosition: CGFloat!
  
  private var open = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}