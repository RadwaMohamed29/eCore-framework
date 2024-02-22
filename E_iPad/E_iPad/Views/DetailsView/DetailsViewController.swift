//
//  DetailsViewController.swift
//  E_iPad
//
//  Created by Menna Allah on 08/02/2024.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView?
    var pdfFileName: String?
    
    init(pdfFileName: String = "") {
        super.init(nibName: nil, bundle: nil)
        self.pdfFileName = pdfFileName
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        configureWebViewConstraints()
        if let fileName = pdfFileName {
            loadPDFFile(named: fileName)
        }
    }
    private func setupWebView(){
        webView = WKWebView(frame: view.bounds)
        webView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView?.navigationDelegate = self
        view.addSubview(webView ?? WKWebView())
    }
    private func configureWebViewConstraints() {
        webView?.translatesAutoresizingMaskIntoConstraints = false
        webView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func loadPDFFile(named fileName: String) {
        guard let pdfFileURL = Bundle.main.url(forResource: fileName, withExtension: "pdf") else {
            print("PDF file not found for \(fileName)")
            return
        }
        
        do {
            let pdfData = try Data(contentsOf: pdfFileURL)
            try loadPDFData(pdfData, from: pdfFileURL)
        } catch {
            print("Error loading PDF data: \(error.localizedDescription)")
        }
    }
    
    private func loadPDFData(_ pdfData: Data, from pdfFileURL: URL) throws {
        webView?.load(pdfData, mimeType: "application/pdf", characterEncodingName: "UTF-8", baseURL: pdfFileURL)
        print("loadPDFFile called successfully")
    }
    
}
