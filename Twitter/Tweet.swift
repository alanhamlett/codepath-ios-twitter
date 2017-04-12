//
//  Tweet.swift
//  Twitter
//
//  Created by alan_hamlett on 4/12/17.
//  Copyright © 2017 Alan Hamlett. All rights reserved.
//

import UIKit

class Tweet: NSObject {

  var text: String?
  var timestamp: NSDate?
  var retweetCount: Int = 0
  var favoritesCount: Int = 0

  init(dictionary:NSDictionary) {

    text = dictionary["text"] as? String
    if let date = dictionary["created_at"] as? String {
      let formatter = DateFormatter()
      formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
      timestamp = formatter.date(from: date) as NSDate?
    }
    retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
    favoritesCount = (dictionary["favourites_count"] as? Int) ?? 0
  }

  class func tweetsArray(dictionaries: [NSDictionary]) -> [Tweet] {
    var tweets = [Tweet]()

    for dictionary in dictionaries {
      tweets.append(Tweet(dictionary:dictionary))
    }

    return tweets
  }

}
