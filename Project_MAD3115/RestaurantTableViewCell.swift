//
//  RestaurantTableViewCell.swift
//  Project_MAD3115
//
//  Created by saikrishna B on 24/11/20.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var RestImage: UIImageView!
    
    @IBOutlet weak var RestName: UILabel!
    
    func setRest(rest:Restaurant){
        RestImage.image=rest.RestImage
        RestName.text=rest.RestName
    }
}
