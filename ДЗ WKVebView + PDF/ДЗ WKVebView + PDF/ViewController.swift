//
//  ViewController.swift
//  ДЗ WKVebView + PDF
//
//  Created by dream.one on 22.08.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit
import WebKit


class ViewController: UIViewController {

    let url = "https://github.com/DevArtistIOS/Lesson-UIKit"
    let webBtn = UIButton()
    let pdfBtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        title = "Главная"
        
        installWebButton()
        installPdfButton()
        
    }
    
// MARK: Устанавливаем кнопку перехода на Веб-Браузер
    fileprivate func installWebButton() {
        webBtn.frame = CGRect(x: 0, y: Int(view.bounds.height - 600), width: 100, height: 100)
        webBtn.center.x = view.center.x
        webBtn.setImage(UIImage(named: "web"), for: .normal)
        webBtn.addTarget(self, action: #selector(goWebViewVC), for: .touchUpInside)
        view.addSubview(webBtn)
      }

// MARK: Устанавливаем кнопку для чтения PDF документа
    fileprivate func installPdfButton() {
        pdfBtn.frame = CGRect(x: 0, y: Int(view.bounds.height - 400), width: 100, height: 100)
        pdfBtn.center.x = view.center.x
        pdfBtn.setImage(UIImage(named: "file"), for: .normal)
        pdfBtn.addTarget(self, action: #selector(goPdfFile), for: .touchUpInside)
        view.addSubview(pdfBtn)
    }

// MARK: Таргет-селектор для перехода на WebViewController
    @objc func goWebViewVC() {
        let webVC = WebViewController(url: self.url)
        self.navigationController?.pushViewController(webVC, animated: true)
    }

// MARK: Таргет-селектор для перехода на PdfViewController
    @objc func goPdfFile() {
        let pdfVC = PdfViewController()
        self.navigationController?.pushViewController(pdfVC, animated: true)
    }
    
}

