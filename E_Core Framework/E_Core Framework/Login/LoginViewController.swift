//
//  LoginViewController.swift
//  E_Core Framework
//
//  Created by Menna on 25/02/2024.
//

import UIKit

public class LoginViewController: UIViewController {
    @IBOutlet weak var splashImageView: UIImageView!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var rememberMeButton: UIButton!
    @IBOutlet weak var eyeButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    public var copyright: String = ""
    public var splashImage: UIImage?
    public var logoImage: UIImage?
    public var loginHandler: (() -> Void)?
    public var resetPasswordHandler: (() -> Void)?
    
    private var animatedSplashView: UIImageView!
    private var isRememberMeSelected = false
    private var isPasswordVisible = false
    
    public init(splashImage: UIImage?,logoImage:UIImage?) {
        super.init(nibName: "LoginViewController", bundle: Bundle(for: LoginViewController.self))
        self.splashImage = splashImage
        self.logoImage = logoImage
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        startSplashAnimation()
        self.hideKeyboardWhenTappedAround()
        
    }
    
    private func configureUI() {
        logoImageView.image = logoImage
        splashImageView.image = splashImage
        splashImageView.contentMode = .scaleAspectFill
        splashImageView.translatesAutoresizingMaskIntoConstraints = false        
        view.addSubview(splashImageView)
        if UIDevice.current.userInterfaceIdiom == .pad {
            NSLayoutConstraint.activate([
                splashImageView.topAnchor.constraint(equalTo: view.topAnchor),
                splashImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                splashImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                splashImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
        
        view.sendSubviewToBack(splashImageView)
    }
    
    private func startSplashAnimation() {
        guard let splashImageView = splashImageView else {
            return
        }
        
        splashImageView.transform = CGAffineTransform(scaleX: 2, y: 2)
        
        UIView.animate(withDuration: 3.0, delay: 0.7, options: .curveEaseInOut, animations: {
            splashImageView.transform = .identity
        }) { _ in
            print("Zoom-out animation completed")
        }
    }
    
    @IBAction func rememberMeAction(_ sender:UIButton) {
        sender.isSelected.toggle()
        
        isRememberMeSelected = sender.isSelected
        
        if isRememberMeSelected {
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    @IBAction func loginAction(_ sender: Any) {
        loginHandler?()
    }
    @IBAction func resetPasswordAction(_ sender: Any) {
        resetPasswordHandler?()
    }
    @IBAction func eyePasswordAction(_ sender: Any) {
        isPasswordVisible.toggle()
        passwordTextField.isSecureTextEntry = !isPasswordVisible
        let eyeButtonImage = isPasswordVisible ? UIImage(systemName: "eye.fill") : UIImage(systemName: "eye.slash.fill")
        eyeButton.setImage(eyeButtonImage, for: .normal)
    }
    
}
extension LoginViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
