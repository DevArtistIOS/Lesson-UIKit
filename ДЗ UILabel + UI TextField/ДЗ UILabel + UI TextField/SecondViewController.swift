//
//  SecondViewController.swift
//  ДЗ UILabel + UI TextField
//
//  Created by dream.one on 06.08.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
   
    let textLabl = UILabel()
    let slider = UISlider()
    let pickerColor = UIPickerView()
    let pickerLines = UIPickerView()
    
    let colorNameArray = ["черный", "красный", "синий", "зеленый", "желтый", "оранжевый", "серый"]
    let colorArray = [UIColor.black, .red, .blue, .green, .yellow, .orange, .gray]
    let lineArray = [1, 2, 3, 4, 5]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Ввод текста"
        
        pickerColor.delegate = self
        pickerColor.dataSource = self
        pickerColor.frame = CGRect(x: 0, y: 500, width: 200, height: 100)
        pickerColor.center.x = view.center.x
        view.addSubview(pickerColor)
        
        pickerLines.delegate = self
        pickerLines.dataSource = self
        pickerLines.frame = CGRect(x: 0, y: 600, width: 200, height: 100)
        pickerLines.center.x = view.center.x
        view.addSubview(pickerLines)

        self.navigationItem.title = "Ввод текста"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTextOnView))
        
        createLabel()
        createSliderOnSizeForText()
        
    }

    
    
// MARK: Создаем Alert для Добавление текста на View
    @objc func addNewTextOnView() {
        let alert = UIAlertController(title: "Добавление текса", message: "Введите текстовое сообщение", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Введите текст"
            textField.textAlignment = .center
            textField.backgroundColor = .white
            textField.textColor = .black
            
        }
        alert.addAction(UIAlertAction(title: "Добавить", style: .default, handler: { (action) in
            guard let textField = alert.textFields else { return }
            guard let text = textField[0].text, !text.isEmpty else { return }
            self.textLabl.text = text
        }))
       
        let alertAction = UIAlertAction(title: "Отмена", style: .destructive, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
// MARK: Create Label Text on View
    fileprivate func createLabel() {
        let labelFrame = CGRect(x: 0, y: 100, width: 300, height: 250)
        textLabl.frame = labelFrame
        textLabl.center.x = view.center.x
        textLabl.lineBreakMode = .byWordWrapping
        textLabl.adjustsFontSizeToFitWidth = true
        textLabl.numberOfLines = 0
        textLabl.text = ""
        textLabl.textAlignment = .center
        textLabl.textColor = .black
        textLabl.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(textLabl)
    }
  
// MARK: Create Slider on Size for Text Label
fileprivate func createSliderOnSizeForText() {
    slider.frame = CGRect(x: 0, y: 350, width: 200, height: 30)
    slider.center.x = view.center.x
    slider.minimumValue = 5
    slider.maximumValue = 40
    slider.addTarget(self, action: #selector(sliderChanged(sender:)), for: .valueChanged)
    view.addSubview(slider)
}
    
// MARK: Действия для слайдера и указание размера
    @objc func sliderChanged(sender: UISlider) {
        let senderValue = CGFloat(sender.value)
        textLabl.font = UIFont(name: textLabl.font.fontName, size: senderValue)
    }
    
}

extension SecondViewController: UIPickerViewDelegate, UIPickerViewDataSource {
// MARK: Количество столбцов в пикере
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           1
       }
    
// MARK: Разбиваем метод пикера на разные состовляющие с разными компонентами по количеству в строке
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerColor {
            return colorNameArray.count
        } else {
            return lineArray.count
        }
        }
// MARK: Добавляет в пикер компоненты массива после установки значений (цвет и кол-во линий)
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerColor {
            textLabl.textColor = colorArray[row]
        } else {
            textLabl.numberOfLines = lineArray[row]
        }
    }
    
// MARK: Добавляет текстовые значения в пикер согласно массиву значений по индексу
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerColor {
            return colorNameArray[row]
        } else {
            return String(lineArray[row])
        }
    }
}
