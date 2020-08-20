//
//  ViewController.swift
//  ДЗ UITabBar (yoga)
//
//  Created by dream.one on 23.07.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let goBtn = UIButton()
    let labelText = UILabel()
    var imageText = UIImageView()
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        createImageBackground()
        createGoBtn()
        createLabelText()
        createImageView()
        
        
    }

// MARK: Создаем на первом экране фон серого цвета под текст
fileprivate func createImageBackground() {
       self.imageText = UIImageView(frame: CGRect(x: 0, y: 0, width: 350, height: 400))
       self.imageText.center = view.center
       self.imageText.backgroundColor = .secondarySystemBackground
       self.imageText.layer.cornerRadius = 10
       self.view.addSubview(imageText)

    }
    
// MARK: Создаем на первом экране кнопку с переходом к Асанам
fileprivate func createGoBtn() {
        self.goBtn.frame = CGRect(x: 0, y: 700, width: 150, height: 40)
        self.goBtn.center.x = self.view.center.x
        self.goBtn.backgroundColor = .black
        self.goBtn.setTitle("Перейти", for: .normal)
        self.goBtn.layer.cornerRadius = 20
        self.view.addSubview(goBtn)
        self.goBtn.addTarget(self, action: #selector(pushToAsanaVC), for: .touchUpInside)
    }
    
 // MARK: Создаем на первом экране картинку на фоне
fileprivate func createImageView() {
        self.imageView = UIImageView(frame: CGRect(x: 0, y: 300, width: 100, height: 10))
        self.imageView.center.x = self.view.center.x
        self.imageView.contentMode = .scaleAspectFill
        let image = UIImage(named: "guru2")
        self.imageView.image = image
        self.view.addSubview(imageView)
    }

 // MARK: Создаем текст на View
fileprivate func createLabelText() {
       self.labelText.frame = CGRect(x: 0, y: 330, width: 320, height: 350)
       self.labelText.center.x = self.view.center.x
       self.labelText.textAlignment = .left
       self.labelText.numberOfLines = 0
       self.labelText.text = "Йога – древняя духовная практика, пришедшая к нам из Индии. Она состоит из восьми ступеней, затрагивающих все аспекты человеческого бытия – от соблюдения моральных принципов, работы с телом и с дыханием, до более тонких техник управления психикой, умом и сознанием.В современном мире под йогой подразумевается в основном – работа с телом."
       self.labelText.font = UIFont(name: "Helvetica Neue", size: 19)
       self.view.addSubview(labelText)
   }
    
// MARK: Метод перехода с главного View на Асаны View
    @objc func pushToAsanaVC() {
        let asanaVC = AsanaViewController()
        self.navigationController?.pushViewController(asanaVC, animated: false)
    }
    
}
