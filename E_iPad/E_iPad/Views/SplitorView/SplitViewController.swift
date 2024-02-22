//
//  SplitViewController.swift
//  E_iPad
//
//  Created by Menna Allah on 08/02/2024.
//

import UIKit

class SplitViewController: UISplitViewController,UISplitViewControllerDelegate {
    
    init() {
        super.init(style: .doubleColumn)
        setupViewControllers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        let masterViewController = MasterTableViewController()
        let detailViewController = DetailsViewController(pdfFileName: "pdf1")
        
        let masterNavigationController = UINavigationController(rootViewController: masterViewController)
        let detailNavigationController = UINavigationController(rootViewController: detailViewController)
        
        viewControllers = [masterNavigationController, detailNavigationController]
        
        configureSplitViewController()
    }
    
    private func configureSplitViewController() {
        preferredDisplayMode = .twoBesideSecondary
        preferredSplitBehavior = .overlay
        delegate = self
    }
}

