//
//  SearchTableView.swift
//  E_Core Framework
//
//  Created by Radwa Mohamed on 25/02/2024.
//

import UIKit

public class SearchTableView: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var dataTableView: UITableView!
    
    public var numberOfRows: Int = 1
    public var subject: [String] = []
    public var attachment: [String] = []
    
    public init(numberOfRows: Int, subject: [String], attachment: [String]) {
        super.init(nibName: "SearchTableView", bundle: Bundle(for: SearchTableView.self))
        self.numberOfRows = numberOfRows
        self.attachment = attachment
        self.subject = subject
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: SearchDataCell.identifier, bundle: nil)
        dataTableView.register(nib, forCellReuseIdentifier: SearchDataCell.identifier)
        dataTableView.dataSource = self
        dataTableView.delegate = self
    }


    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchDataCell.identifier, for: indexPath) as! SearchDataCell
        
        cell.attachmentLabel.text = attachment[indexPath.row]
        cell.subjectLabel.text = subject[indexPath.row]
        
        return cell

    }
    

}
