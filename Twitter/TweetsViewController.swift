//
//  TweetsViewController.swift
//  Twitter
//
//  Created by alan_hamlett on 4/12/17.
//  Copyright © 2017 Alan Hamlett. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  var tweets: [Tweet]?

  override func viewDidLoad() {
    super.viewDidLoad()

    TwitterClient.sharedInstance?.homeTimeline(success: { (tweets: [Tweet]) in
      self.tweets = tweets
      self.tableView.reloadData()
    }, failure: { (error: Error) in
      print("Error getting tweets: \(error)")
    })
  }

  @IBAction func onLogoutButton(_ sender: Any) {
    TwitterClient.sharedInstance?.logout()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
    appDelegate.window?.rootViewController = viewController
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.
  }
  */

}
