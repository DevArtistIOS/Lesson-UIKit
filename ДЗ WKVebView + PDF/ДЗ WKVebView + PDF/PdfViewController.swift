//
//  PdfViewController.swift
//  ДЗ WKVebView + PDF
//
//  Created by dream.one on 22.08.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit
import WebKit

class PdfViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(shareBtn))
        title = "Просмотр файла"
        setupWebViewForPdf()
   
    }
    
// MARK: Задаем Загрузку файла PDF для чтения
    func setupWebViewForPdf() {
        let webView = WKWebView()
        webView.frame = view.bounds
        if let urlPdf = Bundle.main.url(forResource: "Swift book", withExtension: "pdf") {
        let urlRequest = URLRequest(url: urlPdf)
        webView.load(urlRequest)
    }
        view.addSubview(webView)
        
    }
// MARK: Таргет селектор для сохранения странички
    @objc func shareBtn() {
        let items = [UIImage()]
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }


}
