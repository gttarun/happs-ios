//
//  LoginViewController.swift
//  Feed Me
//
//  Created by Nishant Raman on 9/24/16.
//  Copyright © 2016 Ron Kliffer. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {
  
  override func viewDidLoad() {
    let loginButton = FBSDKLoginButton.init()
    loginButton.center = self.view.center
    self.view.addSubview(loginButton);
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    let navControl = segue.destinationViewController as! UINavigationController
    
    let destControl = self.storyboard?.instantiateViewControllerWithIdentifier("MapViewController")
    navControl.pushViewController(destControl!, animated: true)
  }

}
