//
//  OrderViewController.swift
//  Crimea Shoes (UiSegmentControl)
//
//  Created by dream.one on 14.07.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
// MARK: Создаем пикер, кнопку, лейб, тексфилд
    let picker = UIPickerView()
    let pickerTownArray = ["Симферополь", "Севастополь", "Ялта", "Алушта", "Евпатория", "Саки", "Керчь", "Судак", "Черноморское", "Балаклава", "Бахчисарай", "Инкерман", "Форос", "Алупка", "Гурзуф", "Партенит", "Белогорск", "Коктебель", "Щелкино", "Старый Крым", "Приморский", "Феодосия", "Джанской", "Красноперекопск", "Армянск"]
    
    let headingLbl = UILabel()
    let numberLbl = UILabel()
    let numberTextField = UITextField()
    let orderBtn = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Размещаем пикер по центру экрана
        picker.center = view.center
        // Подписываемся на делегат и добавляем на экран
        picker.delegate = self
        self.view.addSubview(picker)
        
        // Размещаем лейблы, текстфилд и кнопку на экране
        headingLbl.frame = CGRect(x: 0, y: 50, width: 400, height: 50)
        headingLbl.text = "Предварительный заказ курьерской доставки"
        headingLbl.textAlignment = .center
        headingLbl.font = UIFont(name: "Helvetica Neue", size: 20)
        headingLbl.numberOfLines = 3
        self.view.addSubview(headingLbl)
        
        numberLbl.frame = CGRect(x: 105, y: 220, width: 200, height: 100)
        numberLbl.text = "Номер телефона:"
        numberLbl.textAlignment = .center
        numberLbl.font = UIFont(name: "Helvetica Neue", size: 17)
        //headingLbl.numberOfLines = 2
        self.view.addSubview(numberLbl)
        
        numberTextField.frame = CGRect(x: 105, y: 300, width: 200, height: 30)
        numberTextField.placeholder = "Введите номер"
        numberTextField.font = UIFont(name: "Helvetica Neue", size: 13)
        numberTextField.keyboardType = .numberPad
        numberTextField.textAlignment = .center
        numberTextField.backgroundColor = .white
        numberTextField.borderStyle = .roundedRect
        self.view.addSubview(numberTextField)
        
        orderBtn.frame = CGRect(x: 105, y: 650, width: 200, height: 60)
        orderBtn.layer.cornerRadius = 15
        orderBtn.backgroundColor = .black
        orderBtn.setTitle("Оформить", for: .normal)
        orderBtn.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 25)
        self.view.addSubview(orderBtn)
        self.orderBtn.addTarget(self, action: #selector(orderAction(target:)), for: .touchUpInside)
        

    }

// MARK: Настройка пикера по количеству городов
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerTownArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerTownArray[row]
    }
    
// MARK:  Таргет переход для кнопки "Оформить"
    @objc func orderAction(target: UIButton) {
        if numberTextField.text!.count <= 10 || numberTextField.text!.count >= 12{
            let alert = UIAlertController(title: "Внимание!", message: "Проверьте правильность ввода номера", preferredStyle: .alert)
            let alerAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            alert.addAction(alerAction)
            present(alert, animated: true, completion: nil)
        } else {
             performSegue(withIdentifier: "segueend", sender: nil)
        }
       
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
  
}
