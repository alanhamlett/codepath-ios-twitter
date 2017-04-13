//
//  TweetsViewController.swift
//  Twitter
//
//  Created by alan_hamlett on 4/12/17.
//  Copyright © 2017 Alan Hamlett. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!

  var tweets: [Tweet]?

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 120

    TwitterClient.sharedInstance?.homeTimeline(success: { (tweets: [Tweet]) in
      self.tweets = tweets
      self.tableView.reloadData()
    }, failure: { (error: Error) in
      print("Error getting tweets: \(error)")
    })
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tweets?.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell") as! TweetCell
    cell.tweet = tweets?[indexPath.row]
    return cell
  }

  @IBAction func onLogoutButton(_ sender: Any) {
    TwitterClient.sharedInstance?.logout()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
    appDelegate.window?.rootViewController = viewController
  }

  @IBAction func onNewButton(_ sender: Any) {
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
