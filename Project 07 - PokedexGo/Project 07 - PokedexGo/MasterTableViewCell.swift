//
//  MasterTableViewCell.swift
//  Project 07 - PokedexGo
//
//  Created by 송서영 on 2021/01/16.
//

import UIKit

class MasterTableViewCell: UITableViewCell {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
