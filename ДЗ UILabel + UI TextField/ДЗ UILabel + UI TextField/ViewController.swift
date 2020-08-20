//
//  ViewController.swift
//  ДЗ UILabel + UI TextField
//
//  Created by dream.one on 06.08.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let textBtn = UIButton()
    let registrationBtn = UIButton()
    var imageView = UIImageView()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Главная"
        
        extractedFunc()
        createRegistBtn()
        createImageView()
        
    }


// MARK: Добавление кнопки на View для текста
fileprivate func extractedFunc() {
    textBtn.frame = CGRect(x: 0, y: 500, width: 170, height: 40)
    textBtn.backgroundColor = .black
    textBtn.center.x = view.center.x
    textBtn.setTitle("Ввод текста", for: .normal)
    textBtn.layer.cornerRadius = 15
    textBtn.addTarget(self, action: #selector(goToTextBtn), for: .touchUpInside)
    view.addSubview(textBtn)
}
// MARK: Добавление кнопки на View для регистрации
fileprivate func createRegistBtn() {
    registrationBtn.frame = CGRect(x: 0, y: 550, width: 170, height: 40)
    registrationBtn.center.x = view.center.x
    registrationBtn.backgroundColor = .black
    registrationBtn.setTitle("Регистрация", for: .normal)
    registrationBtn.layer.cornerRadius = 15
    registrationBtn.addTarget(self, action: #selector(goToRegistrationBtn), for: .touchUpInside)
    view.addSubview(registrationBtn)
}
 
// MARK: Добавление иконки на View
fileprivate func createImageView() {
       imageView.frame = CGRect(x: 0, y: 150, width: 200, height: 300)
       imageView.image = UIImage(named: "cloud")
       imageView.center.x = view.center.x
       imageView.contentMode = .scaleAspectFill
       view.addSubview(imageView)
   }

// MARK: Таргет для кнопки перехода текста
    @objc func goToTextBtn() {
        let seocndView = SecondViewController()
        self.navigationController?.pushViewController(seocndView, animated: false)
    }
// MARK: Таргет для кнопки перехода регистрации
    @objc func goToRegistrationBtn() {
           let registrView = RegistrViewController()
        self.navigationController?.pushViewController(registrView, animated: false)
       }
}
