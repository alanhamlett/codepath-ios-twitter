//
//  User.swift
//  Twitter
//
//  Created by alan_hamlett on 4/12/17.
//  Copyright © 2017 Alan Hamlett. All rights reserved.
//

import UIKit


class User: NSObject {

  private static var _currentUser: User?

  var dictionary: NSDictionary?
  var name: String?
  var screenName: String?
  var location: String?
  var tagline: String?
  var followersCount: Int?
  var favoritesCount: Int?
  var profileUrl: URL?
  var profileImageUrl: URL?

  init(dictionary:NSDictionary) {
    self.dictionary = dictionary

    name = dictionary["name"] as? String
    screenName = dictionary["screen_name"] as? String
    location = dictionary["location"] as? String
    tagline = dictionary["description"] as? String
    followersCount = dictionary["followers_count"] as? Int
    favoritesCount = dictionary["favorites_count"] as? Int
    if let url = dictionary["url"] as? String {
      profileUrl = URL(string: url)
    }
    if let url = dictionary["profile_image_url"] as? String {
      profileImageUrl = URL(string: url)
    }
  }

  class var currentUser: User? {
    get {
      if (_currentUser == nil) {
        let defaults = UserDefaults.standard
        let data = defaults.object(forKey: "currentUser") as? Data
        if let data = data {
          let dictionary = try? JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
          if let dictionary = dictionary {
            _currentUser = User(dictionary: dictionary)
          }
        }
      }
      return _currentUser
    }
    set(user) {
      let defaults = UserDefaults.standard
      if let user = user {
        let json = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
        defaults.set(json, forKey: "currentUser")
      } else {
        defaults.set(nil, forKey: "currentUser")
      }
      defaults.synchronize()
    }
  }

}
