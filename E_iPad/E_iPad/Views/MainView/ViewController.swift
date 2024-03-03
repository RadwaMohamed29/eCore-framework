//
//  ViewController.swift
//  E_iPad
//
//  Created by Menna Allah on 07/02/2024.
//

import UIKit
import E_Core_Framework
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupECore()
    }
    func setupECore(){
        let eCoreUIComponent = TreeVC()
//        E_Core_UI_ComponentVC(
//            message: "Sum of 1+1 = \(E_Core_sum.sum(numbers: [1,1])) calculated using E_Core_sum..sum function",
//            btnTitle: "V.good",
//            btnColor: .green
//        )
//        eCoreUIComponent.btnHandler={
//            let splitVC = SplitViewController()
//            splitVC.modalPresentationStyle = .fullScreen
//            self.present(splitVC, animated: true, completion: nil)
//        }
        addChild(eCoreUIComponent)
        view.addSubview(eCoreUIComponent.view)
        eCoreUIComponent.didMove(toParent: self)
        eCoreUIComponent.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eCoreUIComponent.view.topAnchor.constraint(equalTo: view.topAnchor),
            eCoreUIComponent.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            eCoreUIComponent.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            eCoreUIComponent.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

