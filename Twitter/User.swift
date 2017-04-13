//
//  User.swift
//  Twitter
//
//  Created by alan_hamlett on 4/12/17.
//  Copyright © 2017 Alan Hamlett. All rights reserved.
//

import UIKit


class User: NSObject, NSCoding {

  var name: String?
  var screenName: String?
  var location: String?
  var tagline: String?
  var followersCount: Int?
  var favoritesCount: Int?
  var profileUrl: URL?
  var profileImageUrl: URL?

  init(dictionary:NSDictionary) {
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

  /*public required convenience init?(coder decoder: NSCoder) {
   let dictionary: NSDictionary = [
   "name": decoder.decodeObject(forKey: "name") as? String! ?? "",
   "screenName": decoder.decodeObject(forKey: "screenName") as? String! ?? "",
   "location": decoder.decodeObject(forKey: "location") as? String! ?? "",
   "tagline": decoder.decodeObject(forKey: "tagline") as? String! ?? "",
   "followersCount": decoder.decodeObject(forKey: "followersCount") as? Int! ?? 0,
   "favoritesCount": decoder.decodeObject(forKey: "favoritesCount") as? Int! ?? 0,
   "profileUrl": URL(decoder.decodeObject(forKey: "profileUrl") as? String! ?? ""),
   "profileImageUrl": URL(decoder.decodeObject(forKey: "profileImageUrl") as? String! ?? ""),
   ]
   self.init(dictionary: dictionary)
   }*/

  /*public func encode(with aCoder: NSCoder) {
   aCoder.encode(name, forKey: "name")
   aCoder.encode(screenName, forKey: "screenName")
   aCoder.encode(location, forKey: "location")
   aCoder.encode(tagline, forKey: "tagline")
   aCoder.encode(profileUrl, forKey: "profileUrl")
   aCoder.encode(profileImageUrl, forKey: "profileImageUrl")
   aCoder.encode(followersCount, forKey: "followersCount")
   aCoder.encode(favoritesCount, forKey: "favoritesCount")
   }*/

  /*class var currentUser: User? {
   get {
   let defaults = UserDefaults.standard
   let user = defaults.object(forKey: "currentUser")
   return user as! User?
   }
   set(user) {
   let defaults = UserDefaults.standard
   defaults.set(NSKeyedArchiver.archivedData(withRootObject: user!), forKey: "currentUser")
   }
   }*/

}


/* class User: NSObject {

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
      let defaults = UserDefaults.standard
      /*if let data = defaults.object(forKey: "currentUser") as NSData {
        let user = JSONSerialization.
      }
      return user as! User?*/
      return nil
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

}*/
