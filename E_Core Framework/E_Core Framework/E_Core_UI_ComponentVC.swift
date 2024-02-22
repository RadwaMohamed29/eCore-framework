//
//  E_Core_UI_ComponentVC.swift
//  E_Core Framework
//
//  Created by Menna Allah on 07/02/2024.
//

import UIKit

public class E_Core_UI_ComponentVC: UIViewController {
    
    @IBOutlet weak var e_button: UIButton!
    @IBOutlet weak var e_Label: UILabel!
    
    public var message: String = ""
    public var btnTitle: String = ""
    public var btnColor: UIColor = .clear
    public var btnHandler: (() -> Void)?
    
    public init(message: String, btnTitle: String, btnColor: UIColor) {
        super.init(nibName: "E_Core_UI_ComponentVC", bundle: Bundle(for: E_Core_UI_ComponentVC.self))
        self.message = message
        self.btnTitle = btnTitle
        self.btnColor = btnColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        e_Label.text = message
        e_button.setTitle(btnTitle, for: .normal)
        e_button.setTitleColor(btnColor, for: .normal)
    }
    @IBAction func e_buttonTapped(_ sender: Any) {
        btnHandler?()
    }
}
