//  HomeAccountCell.swift
//  PatientAppNew
//  Created by Doctor Insta on 23/10/17.
//  Copyright © 2017 Doctor Insta. All rights reserved.

import UIKit
class HomeAccountCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
