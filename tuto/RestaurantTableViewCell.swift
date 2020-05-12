//
//  RestaurantTableViewCell.swift
//  tuto
//
//  Created by Thomas Salandre on 11/05/2020.
//  Copyright © 2020 Thomas Salandre. All rights reserved.
///Users/t.salandre/ios/tuto/tuto/RestaurantTableViewCell.swift

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
