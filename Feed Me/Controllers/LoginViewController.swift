//
//  LoginViewController.swift
//  Feed Me
//
//  Created by Nishant Raman on 9/24/16.
//  Copyright © 2016 Ron Kliffer. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
  
  override func viewDidLoad() {
    let loginButton = FBSDKLoginButton.init()
    loginButton.center = self.view.center
    self.view.addSubview(loginButton);
    if((FBSDKAccessToken.currentAccessToken()) != nil){
      self.performSegueWithIdentifier("mapSegue", sender: self)
    }
  }
  
  func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
    print("User Logged In")
    
    self.performSegueWithIdentifier("mapSegue", sender: self)
    
    if ((error) != nil)
    {
      // Process error
    }
    else if result.isCancelled {
      // Handle cancellations
    }
    else {
      // If you ask for multiple permissions at once, you
      // should check if specific permissions missing
      if result.grantedPermissions.contains("email")
      {
        self.performSegueWithIdentifier("mapSegue", sender: self)
        print("segued")
      }
    }
  }
  
  func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
    print("User Logged Out")
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    let destControl = segue.destinationViewController as! LoginViewController
    let navControl = self.navigationController
    //let destControl = self.storyboard?.instantiateViewControllerWithIdentifier("LoginViewController")
    navControl!.pushViewController(destControl, animated: true)
  }

}
