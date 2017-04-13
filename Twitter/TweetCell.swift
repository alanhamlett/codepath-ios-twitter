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
      tweetContentLabel.text = tweet.text
    }
  }

  @IBOutlet weak var avatarImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var screenNameLabel: UILabel!
  @IBOutlet weak var createdAtLabel: UILabel!
  @IBOutlet weak var tweetContentLabel: UILabel!

  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
  }

}
