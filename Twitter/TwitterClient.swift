//
//  TwitterClient.swift
//  Twitter
//
//  Created by alan_hamlett on 4/12/17.
//  Copyright © 2017 Alan Hamlett. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterClient: BDBOAuth1SessionManager {

  // Notifications Sent
  static let userDidLogoutNotification = NSNotification.Name(rawValue: "userDidLogoutNotification")

  static var sharedInstance: TwitterClient?
  static let apiBaseUrl: URL = URL(string: "https://api.twitter.com")!

  var secrets: NSDictionary?

  var loginSuccess: (() -> ())?
  var loginFailure: ((Error) -> ())?

  class func setup() {
    if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist") {
      if let secrets = NSDictionary(contentsOfFile: path) {
        let consumerKey = secrets["consumerKey"] as! String
        let consumerSecret = secrets["consumerSecret"] as! String
        TwitterClient.sharedInstance = TwitterClient(baseURL: TwitterClient.apiBaseUrl, consumerKey: consumerKey, consumerSecret: consumerSecret)
      } else {
        TwitterClient.sharedInstance = nil
      }
    } else {
      TwitterClient.sharedInstance = nil
    }
  }

  func login(success: @escaping () -> (), failure: @escaping (Error) -> ()) {
    loginSuccess = success
    loginFailure = failure

    deauthorize()

    fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: URL(string:"twitterdemo://oauth"), scope: nil, success: { (requestToken: BDBOAuth1Credential?) in
      let token: String = requestToken?.token as String!
      let url = URL(string:"https://api.twitter.com/oauth/authorize?oauth_token=\(token)")!
      UIApplication.shared.open(url, options: [:], completionHandler: { (error: Bool) in
        // Redirected to Twitter login page
      })

    }, failure: { (error: Error?) in
      failure(error!)
    })
  }

  func logout() {
    User.currentUser = nil
    deauthorize()

    NotificationCenter.default.post(name: TwitterClient.userDidLogoutNotification, object: nil)
  }

  func handleAppOpenUrl(url: URL) {
    let requestToken = BDBOAuth1Credential(queryString: url.query)
    //print("Verify Token: \(requestToken?.token!)")
    fetchAccessToken(withPath: "oauth/access_token", method: "POST", requestToken: requestToken, success: { (accessToken: BDBOAuth1Credential?) in
      //print("Access Token: \(accessToken!)")
      self.loginSuccess!()
    }, failure: { (error: Error?) in
      self.loginFailure!(error!)
    })
  }

  func verifyCredentials(success: @escaping (User) -> (), failure: @escaping (Error) -> ()) {
    get("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: { (task: URLSessionDataTask, response: Any?) in
      let user = User(dictionary: response as! NSDictionary)
      success(user)
    }, failure: { (task: URLSessionDataTask?, error: Error) in
      failure(error)
    })
  }

  func homeTimeline(success: @escaping ([Tweet]) -> (), failure: @escaping (Error) -> ()) {
    get("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: { (task: URLSessionDataTask, response: Any?) in
      let tweets = Tweet.tweetsArray(dictionaries: response as! [NSDictionary])
      success(tweets)
    }, failure: { (task: URLSessionDataTask?, error: Error) in
      failure(error)
    })
  }
}
