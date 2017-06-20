//
//  SettingsTableViewCell.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 6/20/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var lessonTitle: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func playButtonTapped(_ sender: Any) {
        print("Play!")
    }
}
