//
//  ViewController.swift
//  E_iPhone
//
//  Created by Menna Allah on 07/02/2024.
//

import UIKit
import E_Core_Framework
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let eCoreUIComponent = TreeVC()
//        E_Core_UI_ComponentVC(
//            message: "Sum of 1+2+3 = \(E_Core_sum.sum(numbers: [1,2,3])) calculated using E_Core_sum..sum function",
//            btnTitle: "good",
//            btnColor: .red
//        )
//        eCoreUIComponent.btnHandler = {
//            self.showAlert()
//        }
        addChild(eCoreUIComponent)
        view.addSubview(eCoreUIComponent.view)
        eCoreUIComponent.didMove(toParent: self)
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
