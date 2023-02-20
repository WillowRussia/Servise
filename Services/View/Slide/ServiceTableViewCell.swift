//
//  ServiceTableViewCell.swift
//  Services
//
//  Created by Willow on 18.02.2023.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {
    static let cellId = "Servise"

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
