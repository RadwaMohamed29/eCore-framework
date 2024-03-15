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
        dataTableView.dataSource = self
        dataTableView.delegate = self

        let nib = UINib(nibName: "SearchDataCell", bundle: Bundle(for: SearchDataCell.self))
        dataTableView.register(nib, forCellReuseIdentifier: "SearchDataCell")
        
        let headerNib = UINib(nibName: "CustomHeaderView", bundle: Bundle(for: CustomHeaderView.self))
        dataTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        
        
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchDataCell", for: indexPath) as! SearchDataCell
        
        cell.attachmentLabel.text = attachment[indexPath.row]
        cell.subjectLabel.text = subject[indexPath.row]
        
        return cell
        
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as! CustomHeaderView
        return headerView
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
        
    }
    
}
