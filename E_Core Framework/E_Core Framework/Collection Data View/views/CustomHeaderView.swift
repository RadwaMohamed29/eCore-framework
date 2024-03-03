//
//  CustomHeaderView.swift
//  E_Core Framework
//
//  Created by Radwa Mohamed on 26/02/2024.
//

import UIKit

class CustomHeaderView: UITableViewHeaderFooterView {


    override func awakeFromNib() {
           super.awakeFromNib()
           print("custom header")
       }
    
    override init(reuseIdentifier: String?) {
           super.init(reuseIdentifier: reuseIdentifier)
       }

       required init?(coder: NSCoder) {
           super.init(coder: coder)
       }
}
