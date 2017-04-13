//
//  Tweet.swift
//  Twitter
//
//  Created by alan_hamlett on 4/12/17.
//  Copyright © 2017 Alan Hamlett. All rights reserved.
//

import UIKit

class Tweet: NSObject {

  var tweetId: Int?
  var text: String?
  var createdAt: Date?
  var retweetCount: Int?
  var favoritesCount: Int?
  var userName: String?
  var userScreenName: String?
  var userImageURL: URL?
  var isRetweet: Bool
  var retweetingUserName: String?

  init(dictionary:NSDictionary) {

    tweetId = dictionary["id"] as? Int
    text = dictionary["text"] as? String
    if let date = dictionary["created_at"] as? String {
      let formatter = DateFormatter()
      formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
      createdAt = formatter.date(from: date)!
    }
    retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
    favoritesCount = (dictionary["favourites_count"] as? Int) ?? 0
    if let retweet = dictionary["retweeted_status"] as? NSDictionary {
      isRetweet = true
      if let user = retweet["user"] as? NSDictionary {
        retweetingUserName = user["name"] as? String
        userName = user["name"] as? String
        userScreenName = user["screen_name"] as? String
        if let url = user["profile_image_url_https"] as? String {
          userImageURL = URL(string: url)!
        }
      }
    } else {
      isRetweet = false
      if let user = dictionary["user"] as? NSDictionary {
        userName = user["name"] as? String
        userScreenName = user["screen_name"] as? String
        if let url = user["profile_image_url_https"] as? String {
          userImageURL = URL(string: url)!
        }
      }
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
