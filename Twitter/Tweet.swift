//
//  Tweet.swift
//  Twitter
//
//  Created by alan_hamlett on 4/12/17.
//  Copyright © 2017 Alan Hamlett. All rights reserved.
//

import UIKit

class Tweet: NSObject {

  let tweetId: Int
  let text: String?
  let timestamp: NSDate?
  let retweetCount: Int
  let favoritesCount: Int
  let userName: String?
  let userScreenName: String?
  let userImageURL: URL?

  init(dictionary:NSDictionary) {

    tweetId = dictionary["id"] as! Int
    text = dictionary["text"] as? String
    if let date = dictionary["created_at"] as? String {
      let formatter = DateFormatter()
      formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
      timestamp = formatter.date(from: date) as NSDate?
    } else {
      timestamp = nil
    }
    retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
    favoritesCount = (dictionary["favourites_count"] as? Int) ?? 0
    if let user = dictionary["user"] as? NSDictionary {
      userName = user["name"] as? String
      userScreenName = user["scren_name"] as? String
      if let url = user["profile_image_url_https"] as? String {
        userImageURL = URL(string: url)
      } else {
        userImageURL = nil
      }
    } else {
      userName = ""
      userScreenName = ""
      userImageURL = nil
    }
  }

  class func tweetsArray(dictionaries: [NSDictionary]) -> [Tweet] {
    var tweets = [Tweet]()

    for dictionary in dictionaries {
      tweets.append(Tweet(dictionary:dictionary))
    }

    return tweets
  }

}
