//
//  ThreeViewController.swift
//  ДЗ UITabBar (yoga)
//
//  Created by dream.one on 27.07.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {

    var index = 0
    let numberMyth = UILabel()
    let mythTextView = UITextView()
    var imageView = UIImageView()
    let nextBtn = UIButton()
    let backBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backItem?.title = "Мифы"
        //self.title = "Мифы о Йоге"
        
        createText()
        createImage()
        createTextViewMyth()
        createBackBtn()
        createNextBtn()
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.title = "Мифы"
//    }
    
    fileprivate func createText() {
        self.numberMyth.frame = CGRect(x: 0, y: 100, width: 200, height: 30)
        self.numberMyth.text = "Миф № \(index + 1)"
        self.numberMyth.center.x = self.view.center.x
        self.numberMyth.font = UIFont.systemFont(ofSize: 30.0)
        self.numberMyth.textAlignment = .center
        self.view.addSubview(numberMyth)
    }
    
    fileprivate func createImage() {
        self.imageView = UIImageView(frame: CGRect(x: 0, y: 250, width: 150, height: 75))
        self.imageView.center.x = self.view.center.x
        self.imageView.contentMode = .scaleAspectFill
        let image = UIImage(named: "flower")
        self.imageView.image = image
        self.view.addSubview(imageView)
    }
    
    
    fileprivate func createTextViewMyth() {
        self.mythTextView.frame = CGRect(x: 0, y: 370, width: 400, height: 500)
        self.mythTextView.center.x = self.view.center.x
        self.mythTextView.layer.cornerRadius = 10
        self.mythTextView.backgroundColor = .secondarySystemBackground
        self.mythTextView.font = UIFont.systemFont(ofSize: 18.0)
        self.mythTextView.text = TextOnView.mythsArray[index]
        self.mythTextView.textAlignment = .left
        sizeText()
    }
    
    fileprivate func createBackBtn() {
        self.backBtn.frame = CGRect(x: 20, y: 700, width: 100, height: 40)
        self.backBtn.setTitle("Назад", for: .normal)
        self.backBtn.layer.cornerRadius = 20
        self.backBtn.backgroundColor = .black
        self.backBtn.isHidden = true
        self.backBtn.addTarget(self, action: #selector(goBackMyth), for: .touchUpInside)
        self.view.addSubview(backBtn)
    }
        
        
    fileprivate func createNextBtn() {
           self.nextBtn.frame = CGRect(x: 290, y: 700, width: 100, height: 40)
           self.nextBtn.setTitle("Вперед", for: .normal)
           self.nextBtn.layer.cornerRadius = 20
           self.nextBtn.backgroundColor = .black
           self.nextBtn.addTarget(self, action: #selector(goNextMyth), for: .touchUpInside)
           self.view.addSubview(nextBtn)
       }
    
    @objc func goBackMyth() {
        index -= 1
        numberMyth.text = "Миф № \(index + 1)"
        mythTextView.text = TextOnView.mythsArray[index]
        
        if index == TextOnView.mythsArray.startIndex {
            backBtn.isHidden = true
        } else {
            backBtn.isHidden = false
            nextBtn.isHidden = false
        }
    }
    
    @objc func goNextMyth() {
        index += 1
        numberMyth.text = "Миф № \(index + 1)"
        mythTextView.text = TextOnView.mythsArray[index]
        
        if index < TextOnView.mythsArray.endIndex - 1 {
            backBtn.isHidden = false
            nextBtn.isHidden = false
            numberMyth.text = "Миф № \(index + 1)"
        } else if index == TextOnView.mythsArray.startIndex {
            backBtn.isHidden = true
        } else {
            nextBtn.isHidden = true
            numberMyth.text = "Миф № \(TextOnView.mythsArray.endIndex)"
        }
    }

    func sizeText() {
        let contentSize = mythTextView.sizeThatFits(mythTextView.bounds.size)
        var frame = mythTextView.frame
        frame.size.height = contentSize.height
        mythTextView.frame = frame
        view.addSubview(mythTextView)
    }
}
