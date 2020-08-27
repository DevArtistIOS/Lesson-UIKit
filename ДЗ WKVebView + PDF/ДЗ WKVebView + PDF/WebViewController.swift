//
//  WebViewController.swift
//  ДЗ WKVebView + PDF
//
//  Created by dream.one on 22.08.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    
    
    init(url: String) {
        super.init(nibName: nil, bundle: nil)
        guard let url = URL(string: url) else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var webView: WKWebView = {
        let view = WKWebView()
        view.navigationDelegate = self
        return view
    }()
    
    let toolBar = UIToolbar()
    let searchBar = UISearchBar()

    let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
    let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
    
    let backBarBtnItem = UIBarButtonItem(image: UIImage(named: "chevron"), style: .done, target: self, action: #selector(backItemToolBar))
    
    let forwardBarBtnItem = UIBarButtonItem(image: UIImage(named: "chevron.rigth"), style: .done, target: self, action: #selector(forwardItemToolBar))
    
    let stopBarBtnItem = UIBarButtonItem(image: UIImage(named: "xmark"), style: .done, target: self, action: #selector(stopItemToolBar))
           
    let refreshBarBtnItem = UIBarButtonItem(image: UIImage(named: "refresh"), style: .done, target: self, action: #selector(refreshToolBar))
    
    let shareBarBtnImem = UIBarButtonItem(image: UIImage(named: "share"), style: .done, target: self, action: #selector(shareToolBar))
    
    
// Индикатор загрузки по центру экрана
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        activityIndicator.center = view.center
        activityIndicator.color = .darkGray
        view.addSubview(activityIndicator)
        
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        webView.allowsBackForwardNavigationGestures = true
        view.addSubview(webView)
        setupSearchBar()
        setupToolBar()
        
    }

// MARK: Установка ToolBar for WKWebView
    func setupToolBar() {
        fixedSpace.width = 10
        flexibleSpace.width = 35
        toolBar.backgroundColor = .systemGray
        toolBar.backgroundColor = navigationController?.navigationBar.backgroundColor
        toolBar.tintColor = .systemBlue
        toolBar.isTranslucent = true
        toolBar.items = [fixedSpace, backBarBtnItem, fixedSpace, fixedSpace, forwardBarBtnItem, flexibleSpace, shareBarBtnImem, flexibleSpace, stopBarBtnItem,  flexibleSpace, refreshBarBtnItem]
        toolBar.frame = CGRect(x: 0, y: 830, width: Int(view.bounds.width), height: 44)
        view.addSubview(toolBar)
    }
    
// MARK: Устанавливаем SearchBar и загружаем его
    func setupSearchBar() {
        navigationItem.titleView = searchBar
        searchBar.placeholder = "Веб поиск или имя сайта"
        searchBar.delegate = self
        
    }
 
// MARK: Таргет-селектор для возврата назад по загруженным страницам
    @objc func backItemToolBar() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
// MARK: Таргет-селектор для перехода вперед по загруженным страницам
    @objc func forwardItemToolBar() {
        if webView.canGoForward {
            webView.goForward()
        }
    }

// MARK: Таргет-селектор Остановить загрузку
    @objc func stopItemToolBar() {
        webView.stopLoading()
    }
    
// MARK: Таргет- селектор Перезагрузка странички
    @objc func refreshToolBar() {
        webView.reload()
    }

// MARK: Share для ссылок
    @objc func shareToolBar() {
        let items = [webView.url]
        let activityContoller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityContoller, animated: true, completion: nil)
        
    }

}

// MARK: Расширение для WebViewController по загрузке WKWebView and SearchBar
extension WebViewController: WKNavigationDelegate, UISearchBarDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
        backBarBtnItem.isEnabled = webView.canGoBack
        forwardBarBtnItem.isEnabled = webView.canGoForward
        
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        backBarBtnItem.isEnabled = webView.canGoBack
        forwardBarBtnItem.isEnabled = webView.canGoForward
        
        if let url = self.webView.url {
            self.searchBar.text = url.absoluteString
        }

    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let searchText = self.searchBar.text {
            let urlText = "https://www.google.com/search?q=" + searchText
            let url = URL(string: urlText)
            let requst = URLRequest(url: url!)
            webView.load(requst)
        }

    }
    

}
