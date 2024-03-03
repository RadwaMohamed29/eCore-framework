//
//  ViewController.swift
//  E_iPhone
//
//  Created by Menna Allah on 07/02/2024.
//

import UIKit

import UIKit
import E_Core_Framework


enum CoreName: CaseIterable {
    case Alaa
    case Menna
    case Radwa
    
    
    var name: String {
        switch self {
        case .Alaa:
            return "Core_Alaa"
        case .Menna:
            return "Core_Menna"
        case .Radwa:
            return "Core_Radwa"
        }
    }
    
    var icon: String {
        switch self {
        case .Alaa:
            return "AppIcon"
        case .Menna:
            return "AppIcon.Debug"
        case .Radwa:
            return "AppIcon.Component"
        }
    }
}
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        

            // Accessing values from Info.plist
            if let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
                print("App Name: \(appName)")
                if appName == CoreName.Radwa.name {
                    let search = SearchTableView(numberOfRows: 3, subject: ["موضوع بحث","موضوع هام","موضوع للعلم"], attachment: ["1","2","3"])
                    addChild(search)
                    view.addSubview(search.view)
                    search.didMove(toParent: self)
                } else if appName == CoreName.Menna.name {
                    let coreUI = LoginViewController(splashImage: UIImage(named: "splash"),
                                                     logoImage: UIImage(named: "logo"))
                    addChild(coreUI)
                    view.addSubview(coreUI.view)
                    coreUI.didMove(toParent: self)
                    
                } else {
            
                    let coreUI = TreeVC()
                    addChild(coreUI)
                    view.addSubview(coreUI.view)
                    coreUI.didMove(toParent: self)
                }
            }

                
        
     

    }
    
    func showAlert()  {
        let urlString = "https://www.yourwebsite.com"
        guard let qrCodeImage = generateQRCode(from: urlString) else {
            return
        }
        
        let qrDialogue = UIAlertController(title: "QR Code", message: nil, preferredStyle: .alert)
        qrDialogue.addImage(qrCodeImage)
        present(qrDialogue, animated: true, completion: nil)
    }
    
    func generateQRCode(from urlString: String) -> UIImage? {
        if let data = urlString.data(using: String.Encoding.ascii) {
            if let filter = CIFilter(name: "CIQRCodeGenerator") {
                filter.setValue(data, forKey: "inputMessage")
                let transform = CGAffineTransform(scaleX: 10, y: 10)
                if let output = filter.outputImage?.transformed(by: transform) {
                    return UIImage(ciImage: output)
                }
            }
        }
        return nil
    }
}
extension UIAlertController {
    func addImage(_ image: UIImage) {
        let maxSize = CGSize(width: 245, height: 300)
        let imageSize = image.size

        var ratio: CGFloat = 0
        if imageSize.width > imageSize.height {
            ratio = maxSize.width / imageSize.width
        } else {
            ratio = maxSize.height / imageSize.height
        }

        let scaledSize = CGSize(width: imageSize.width * ratio, height: imageSize.height * ratio)
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: scaledSize))
        imageView.image = image

        self.view.addSubview(imageView)
    }
}
