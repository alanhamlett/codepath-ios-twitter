//
//  TweetCell.swift
//  Twitter
//
//  Created by alan_hamlett on 4/13/17.
//  Copyright © 2017 Alan Hamlett. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

  var tweet: Tweet! {
    didSet {
      nameLabel.text = tweet.userName
      screenNameLabel.text = "@\(tweet.userScreenName!)"
      tweetContentLabel.text = tweet.text
      avatarImageView.setImageWith(tweet.userImageURL!)
      if var seconds = tweet.createdAt?.timeIntervalSinceNow {
        seconds = abs(seconds)
        if seconds > 60 {
          seconds /= 60
          if seconds > 60 {
            seconds /= 60
            let duration = String(format: "%.0f", round(seconds))
            createdAtLabel.text = "\(duration)h"
          } else {
            let duration = String(format: "%.0f", round(seconds))
            createdAtLabel.text = "\(duration)m"
          }
        } else {
          let duration = String(format: "%.0f", round(seconds))
          createdAtLabel.text = "\(duration)s"
        }
      }
      if tweet.isRetweet {
        retweetedByNameLabel.text = "\(tweet.retweetingUserName!) retweeted"
        retweetedByImageView.isHidden = false
        retweetedByNameLabel.isHidden = false
      } else {
        retweetedByImageView.isHidden = true
        retweetedByNameLabel.isHidden = true
      }
    }
  }

  @IBOutlet weak var avatarImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var screenNameLabel: UILabel!
  @IBOutlet weak var createdAtLabel: UILabel!
  @IBOutlet weak var tweetContentLabel: UILabel!
  @IBOutlet weak var retweetedByImageView: UIImageView!
  @IBOutlet weak var retweetedByNameLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()

    avatarImageView?.layer.cornerRadius = 5
    avatarImageView?.clipsToBounds = true
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

}
