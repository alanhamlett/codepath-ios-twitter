//
//  LoginViewController.swift
//  Twitter
//
//  Created by alan_hamlett on 4/9/17.
//  Copyright © 2017 Alan Hamlett. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func onLoginButtonClicked(_ sender: Any) {
    TwitterClient.sharedInstance?.login(success: { () in
      TwitterClient.sharedInstance?.verifyCredentials(success: { (user: User) in

        User.currentUser = user
        self.performSegue(withIdentifier: "loginSegue", sender: nil)

      }, failure: { (error: Error) in
        print("Error getting current user: \(error)")
      })
    }, failure: { (error: Error?) in
      print("Error Logging In: \(error?.localizedDescription)")
    })
  }

}
