//
//  AsanaViewController.swift
//  ДЗ UITabBar (yoga)
//
//  Created by dream.one on 29.07.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class AsanaViewController: UIViewController {

    let numberLbl = UILabel()
    let textLbl = UITextView()
    let nameAsanaLbl = UILabel()
    
    let leftBtn = UIButton()
    let rigthBtn = UIButton()
   
    let imageView = UIImageView()
    var index = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Асаны для начинающих"
       // self.navigationController?.navigationBar.backItem?.title = "На главную"
        
        
        createNumberText()
        createImageView()
        createTextView()
        createLeftBtn()
        createRigthBtn()
        
    }
    
fileprivate func createNumberText() {
    self.numberLbl.frame = CGRect(x: 0, y: 100, width: 200, height: 30)
    self.numberLbl.text = "Асана \(index + 1) из \(TextOnView.asanaImageArray.endIndex)"
    self.numberLbl.center.x = self.view.center.x
    self.numberLbl.font = UIFont.systemFont(ofSize: 30.0)
    self.numberLbl.textAlignment = .center
    self.view.addSubview(numberLbl)
}
    
    
fileprivate func createImageView() {
    self.imageView.image = TextOnView.asanaImageArray[index]
    self.imageView.frame = CGRect(x: 0, y: 230, width: 300, height: 150)
    self.imageView.center.x = self.view.center.x
    self.imageView.contentMode = .scaleAspectFill
    self.view.addSubview(imageView)
}
    
    
fileprivate func createTextView() {
       self.textLbl.frame = CGRect(x: 0, y: 430, width: 400, height: 250)
       self.textLbl.center.x = self.view.center.x
       self.textLbl.layer.cornerRadius = 10
       self.textLbl.backgroundColor = UIColor.init(white: 0.9, alpha: 0.5)
       self.textLbl.font = UIFont.systemFont(ofSize: 16.0)
       self.textLbl.text = TextOnView.asanaArray[index]
       self.textLbl.textAlignment = .left
       sizeText()
   }
    
    
fileprivate func createLeftBtn() {
    self.leftBtn.frame = CGRect(x: 20, y: 760, width: 150, height: 40)
    self.leftBtn.setTitle("Предыдущая", for: .normal)
    self.leftBtn.layer.cornerRadius = 20
    self.leftBtn.backgroundColor = .black
    self.leftBtn.isHidden = true
    self.leftBtn.addTarget(self, action: #selector(goBackAsana), for: .touchUpInside)
    self.view.addSubview(leftBtn)
}
    
    
fileprivate func createRigthBtn() {
       self.rigthBtn.frame = CGRect(x: 240, y: 760, width: 150, height: 40)
       self.rigthBtn.setTitle("Следующая", for: .normal)
       self.rigthBtn.layer.cornerRadius = 20
       self.rigthBtn.backgroundColor = .black
    self.rigthBtn.addTarget(self, action: #selector(goNextAsana), for: .touchUpInside)
       self.view.addSubview(rigthBtn)
   }
    

    @objc func goNextAsana() {
        index += 1
        textLbl.text = TextOnView.asanaArray[index]
        imageView.image = TextOnView.asanaImageArray[index]
        // nameAsanaLbl.text
        
        if index < TextOnView.asanaImageArray.endIndex - 1 {
            numberLbl.text = "Асана \(index + 1) из \(TextOnView.asanaImageArray.endIndex)"
            leftBtn.isHidden = false
            rigthBtn.isHidden = false
        } else if index == TextOnView.asanaImageArray.startIndex {
            leftBtn.isHidden = true
        } else {
            //numberLbl.text = "10 из 10"
            numberLbl.text = "Асана \(index + 1) из \(TextOnView.asanaImageArray.endIndex)"
            rigthBtn.isHidden = true
        }
        
        sizeText()
    }
    
    @objc func goBackAsana() {
        index -= 1
        textLbl.text = TextOnView.asanaArray[index]
        imageView.image = TextOnView.asanaImageArray[index]
        numberLbl.text = "Асана \(index + 1) из \(TextOnView.asanaImageArray.endIndex)"
        
        if index == TextOnView.asanaImageArray.startIndex {
            leftBtn.isHidden = true
        } else {
            leftBtn.isHidden = false
            rigthBtn.isHidden = false
        }
    }
    
func sizeText() {
       let contentSize = textLbl.sizeThatFits(textLbl.bounds.size)
       var frame = textLbl.frame
       frame.size.height = contentSize.height
       textLbl.frame = frame
       view.addSubview(textLbl)
   }


}
