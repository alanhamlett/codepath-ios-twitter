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
      screenNameLabel.text = "@\(tweet.userScreenName)"
      tweetContentLabel.text = tweet.text
      avatarImageView.setImageWith(tweet.userImageURL!)
    }
  }

  @IBOutlet weak var avatarImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var screenNameLabel: UILabel!
  @IBOutlet weak var createdAtLabel: UILabel!
  @IBOutlet weak var tweetContentLabel: UILabel!

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
