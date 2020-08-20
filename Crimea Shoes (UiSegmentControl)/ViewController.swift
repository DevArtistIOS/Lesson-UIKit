//
//  ViewController.swift
//  Crimea Shoes (UiSegmentControl)
//
//  Created by dream.one on 14.07.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var runSegment = UISegmentedControl()
    var numberSegment = UISegmentedControl()
    var genderSegment = UISegmentedControl()
    
    let imageShoes = UIImageView()
    let imageView = UIImageView()
    let sizeSlider = UISlider()
    
    let nameShopLbl = UILabel()
    let priceLbl = UILabel()
    let sizeLbl = UILabel()
    
    let order = UIButton()
    
    var menArray = ["Бег", "Футбол"]
    var womanArray = ["Бег", "Фитнес"]
    var numberArray = ["1", "2", "3", "4", "5"]
    
    // Image Array
    var runMensArray = [UIImage(named: "1"),
                        UIImage(named: "2"),
                        UIImage(named: "3"),
                        UIImage(named: "4"),
                        UIImage(named: "5")]
    
    var footballMensArray = [UIImage(named: "6"),
                             UIImage(named: "7"),
                             UIImage(named: "8"),
                             UIImage(named: "9"),
                             UIImage(named: "10")]
    
    var runWomansArray = [UIImage(named: "11"),
                          UIImage(named: "12"),
                          UIImage(named: "13"),
                          UIImage(named: "14"),
                          UIImage(named: "15")]
    
    var fintessWomansArray = [UIImage(named: "16"),
                             UIImage(named: "17"),
                             UIImage(named: "18"),
                             UIImage(named: "19"),
                             UIImage(named: "20")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        imageView.frame = CGRect(x: 0, y: 50, width: 800, height: 60)
        imageView.backgroundColor = .lightGray
        view.addSubview(imageView)
        
        nameShopLbl.frame = CGRect(x: 55, y: 65, width: 300, height: 30)
        nameShopLbl.text = "CRIMEA TOP STORE"
        nameShopLbl.tintColor = .blue
        nameShopLbl.font = UIFont(name: "Helvetica Neue", size: 30)
        nameShopLbl.textAlignment = .center
        view.addSubview(nameShopLbl)
        
        imageShoes.frame = CGRect(x: 0, y: 200, width: 350, height: 350)
        imageShoes.image = runMensArray[0]
        imageShoes.center.x = view.center.x
        view.addSubview(imageShoes)
        
        runSegment = UISegmentedControl(items: menArray)
        runSegment.frame = CGRect(x: 0, y: 580, width: 200, height: 30)
        runSegment.selectedSegmentIndex = 0
        runSegment.center.x = view.center.x
        view.addSubview(runSegment)
        runSegment.addTarget(self, action: #selector(segmentChangedType(sender:)), for: .valueChanged)
        
        numberSegment = UISegmentedControl(items: numberArray)
        numberSegment.frame = CGRect(x: 0, y: 630, width: 300, height: 30)
        numberSegment.selectedSegmentIndex = 0
        numberSegment.center.x = view.center.x
        numberSegment.selectedSegmentTintColor = .systemBlue
        view.addSubview(numberSegment)
        numberSegment.addTarget(self, action: #selector(segmentChangedNumber(sender:)), for: .valueChanged)
        
        priceLbl.frame = CGRect(x: 140, y: 150, width: 200, height: 30)
        priceLbl.text = "9290 RUB"
        priceLbl.tintColor = .black
        //priceLbl.center.x = view.center.x
        priceLbl.font = UIFont(name: "Helvetica Neue", size: 30)
        view.addSubview(priceLbl)
        
        sizeSlider.frame = CGRect(x: 0, y: 700, width: 300, height: 30)
        sizeSlider.center.x = view.center.x
        sizeSlider.minimumValue = 38
        sizeSlider.maximumValue = 46
        view.addSubview(sizeSlider)
        sizeSlider.addTarget(self, action: #selector(sliderChanged(target:)), for: .valueChanged)
        
        sizeLbl.frame = CGRect(x: 0, y: 680, width: 80, height: 20)
        sizeLbl.center.x = view.center.x
        sizeLbl.text = "Size 39"
        sizeLbl.textAlignment = .center
        view.addSubview(sizeLbl)
        
        order.frame = CGRect(x: 0, y: 750, width: 150, height: 50)
        order.backgroundColor = .black
        order.center.x = view.center.x
        order.setTitle("Заказать", for: .normal)
        order.layer.cornerRadius = 15
        view.addSubview(order)
        order.addTarget(self, action: #selector(orderShoes(target:)), for: .touchUpInside)
        
    }

// MARK: Действия для слайдера и указание размера
    
    @objc func sliderChanged(target: UISwitch) {
        if target.isEqual(sizeSlider) {
            self.sizeLbl.text = "Size \(Int(self.sizeSlider.value))"
        }
    }
    
// MARK: Действия для кнопки "Заказать"
    
    @objc func orderShoes(target: UIButton) {
        performSegue(withIdentifier: "segueorder", sender: nil)
    }
    
// MARK: Действия для  мужского segment & football
    
    @objc func segmentChangedType (sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 && runSegment.selectedSegmentIndex == 0 {
            imageShoes.image = runMensArray[0]
            priceLbl.text = "9290 RUB"
        } else if sender.selectedSegmentIndex == 1 && runSegment.selectedSegmentIndex == 1 {
            imageShoes.image = footballMensArray[0]
            priceLbl.text = "12990 RUB"
        } else if  sender.selectedSegmentIndex == 0 {
           imageShoes.image = runMensArray[0]
            priceLbl.text = "9290 RUB"
        }
        
    }
    
// MARK: Действия для number segment
    
    @objc func segmentChangedNumber (sender: UISegmentedControl) {
        if sender == numberSegment && runSegment.selectedSegmentIndex != 1 {
            switch sender.selectedSegmentIndex {
            case 0:
                imageShoes.image = runMensArray[0]
                priceLbl.text = "9290 RUB"
            case 1:
                imageShoes.image = runMensArray[1]
                priceLbl.text = "9999 RUB"
            case 2:
                imageShoes.image = runMensArray[2]
                priceLbl.text = "9990 RUB"
            case 3:
                imageShoes.image = runMensArray[3]
                priceLbl.text = "7380 RUB"
            case 4:
                imageShoes.image = runMensArray[4]
                priceLbl.text = "6780 RUB"
            default: break
            }
        } else {
            switch sender.selectedSegmentIndex {
            case 0:
                imageShoes.image = footballMensArray[0]
                priceLbl.text = "12990 RUB"
            case 1:
                imageShoes.image = footballMensArray[1]
                priceLbl.text = "13680 RUB"
            case 2:
                imageShoes.image = footballMensArray[2]
                priceLbl.text = "12180 RUB"
            case 3:
                imageShoes.image = footballMensArray[3]
                priceLbl.text = "7780 RUB"
            case 4:
                imageShoes.image = footballMensArray[4]
                priceLbl.text = "12080 RUB"
            default: break
            }
        }
    }
    
// MARK: Segue for endVC on VC shoes
    
    @IBAction func unwindSegueToMainScreen (seque: UIStoryboardSegue) {
        
    }
    
}

