//
//  ReceiverTableViewCell.swift
//  B2CSDK
//
//  Created by Raj Kadam on 17/05/22.
//

import UIKit

class ReceiverTableViewCell: UITableViewCell {
    //@IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureUI(){
//        profileImage.layer.cornerRadius = profileImage.frame.size.height/2
//        profileImage.layer.borderWidth = 1
//        profileImage.layer.borderColor = UIColor.receiverProfileBorder.cgColor
        
        nameLabel.layer.cornerRadius = 4//profileImage.frame.size.height/2
        nameLabel.layer.borderWidth = 0
        nameLabel.layer.borderColor = UIColor.receiverProfileBorder.cgColor
    }
    
    func setupCellData(message: ChatMessage) {
        messageLabel.text = message.message
        let name = message.userName ?? "Degpeg"
        nameLabel.text = "  \(name)"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
