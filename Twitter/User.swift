//
//  User.swift
//  Twitter
//
//  Created by alan_hamlett on 4/12/17.
//  Copyright © 2017 Alan Hamlett. All rights reserved.
//

import UIKit

class User: NSObject {

  var name: String?
  var screenName: String?
  var location: String?
  var tagline: String?
  var profileImageUrl: URL?
  var followersCount: Int?
  var favoritesCount: Int?
  var profileUrl: URL?

  init(dictionary:NSDictionary) {
    name = dictionary["name"] as? String
    screenName = dictionary["screen_name"] as? String
    location = dictionary["location"] as? String
    tagline = dictionary["description"] as? String
    if let url = dictionary["profile_image_url"] as? String {
      profileImageUrl = URL(string: url)
    }
    if let url = dictionary["url"] as? String {
      profileUrl = URL(string: url)
    }
    followersCount = dictionary["followers_count"] as? Int
    favoritesCount = dictionary["favorites_count"] as? Int
  }

}
