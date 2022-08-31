//
//  CustomTableViewCell.swift
//  MoviesList
//
//  Created by Kostiantyn Kaniuka on 31.08.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
