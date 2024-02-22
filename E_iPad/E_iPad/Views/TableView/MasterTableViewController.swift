//
//  MasterTableViewController.swift
//  E_iPad
//
//  Created by Menna Allah on 08/02/2024.
//

import UIKit

class MasterTableViewController: UITableViewController {
   private var pdfFileNames = ["pdf1", "pdf2","pdf3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
  private func registerCell(){
        let cellNib = UINib(nibName: "PdfTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "PdfTableViewCell")
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pdfFileNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PdfTableViewCell", for: indexPath) as! PdfTableViewCell
        cell.titleLabel.text = pdfFileNames[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFileName = pdfFileNames[indexPath.row]
        print("Selected PDF File: \(selectedFileName)")
        
        if let splitVC = splitViewController as? SplitViewController {
            let rightWebVC = DetailsViewController(pdfFileName: selectedFileName)
            splitVC.showDetailViewController(rightWebVC, sender: self)
        }
    }

}
