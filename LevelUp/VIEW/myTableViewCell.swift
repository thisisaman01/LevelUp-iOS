//
//  myTableViewCell.swift
//  LevelUp
//
//  Created by AMAN K.A on 15/01/24.
//

import UIKit

class myTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var myimage: UIImageView!
    
    @IBOutlet weak var mylabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
