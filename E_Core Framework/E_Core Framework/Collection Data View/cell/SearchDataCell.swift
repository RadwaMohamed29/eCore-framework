//
//  SearchDataCell.swift
//  E_Core Framework
//
//  Created by Radwa Mohamed on 25/02/2024.
//

import UIKit

class SearchDataCell: UITableViewCell {

    @IBOutlet weak var attachmentLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    
    public static let identifier = "SearchDataCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
