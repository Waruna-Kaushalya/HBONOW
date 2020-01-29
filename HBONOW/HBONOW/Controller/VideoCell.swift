//
//  VideoCeell.swift
//  HBONOW
//
//  Created by Waruna Kaushalya on 1/29/20.
//  Copyright © 2020 Waruna Kaushalya. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {
    

    @IBOutlet weak var VideoImageView: UIImageView!
    @IBOutlet weak var VideoTitleLabel: UILabel!
    
    func setVideo(video: Video)  {
        VideoImageView.image = video.iamage
        VideoTitleLabel.text = video.title
    }
    
    
}
