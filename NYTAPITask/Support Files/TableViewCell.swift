//
//  TableViewCell.swift
//  NYTAPITask
//
//  Created by Nikhil Patil on 06/04/19.
//  Copyright © 2019 Nikhil Patil. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    //MARK: Var Connections Outlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var abstractLbl: UILabel!
    @IBOutlet weak var publishedDateLbl: UILabel!
    @IBOutlet weak var copyrightsLbl: UILabel!
    @IBOutlet weak var imageURLOfImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
