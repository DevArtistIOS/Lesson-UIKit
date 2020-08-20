//
//  ViewController.swift
//  ДЗ TextView + Button
//
//  Created by dream.one on 12.08.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let textView = UITextView()
    let mySwitch = UISwitch()
    let slider = UISlider()
    var picker = UIPickerView()
    let imageViewSwitch = UIImageView()
    
    let blackbtn = UIButton()
    let redBtn = UIButton()
    let greenBtn = UIButton()
    let blueBtn = UIButton()
    let boldBigBtn = UIButton()
    let boldSmallBtn = UIButton()
    
    let sizeLbl = UILabel()
    let colorLbl = UILabel()
    
    //  Шрифт для изменения размера текста в установку слайдера
    var font = "TrebuchetMS"
    var sizeText: CGFloat = 20
    
    var fontArray = ["TrebuchetMS", "Arial", "Cochin", "Noteworthy", "Rockwell", "Chalkdaster", "AmericanTypewriter", "Verdana", "Baskerville"]
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Редактор"
        
        createTextView()
        createImageSwitch()
        createSlider()
        createSizeLblOnSlider()
        createSwitch()
        createPicker()
        
        redBtn.frame = CGRect(x: 280, y: 700, width: 40, height: 40)
        redBtn.layer.cornerRadius = redBtn.frame.height/2
        redBtn.backgroundColor = .red
        redBtn.addTarget(self, action: #selector(colorText(sender:)), for: .touchUpInside)
        view.addSubview(redBtn)
        
        blackbtn.frame = CGRect(x: 330, y: 700, width: 40, height: 40)
        blackbtn.layer.cornerRadius = blackbtn.frame.height/2
        blackbtn.backgroundColor = .black
        blackbtn.addTarget(self, action: #selector(colorText(sender:)), for: .touchUpInside)
        view.addSubview(blackbtn)
        
        blueBtn.frame = CGRect(x: 280, y: 750, width: 40, height: 40)
        blueBtn.layer.cornerRadius = blueBtn.frame.height/2
        blueBtn.backgroundColor = .blue
        blueBtn.addTarget(self, action: #selector(colorText(sender:)), for: .touchUpInside)
        view.addSubview(blueBtn)
        
        greenBtn.frame = CGRect(x: 330, y: 750, width: 40, height: 40)
        greenBtn.layer.cornerRadius = greenBtn.frame.height/2
        greenBtn.backgroundColor = .green
        greenBtn.addTarget(self, action: #selector(colorText(sender:)), for: .touchUpInside)
        view.addSubview(greenBtn)
        
        colorLbl.frame = CGRect(x: 225, y: 660, width: 200, height: 30)
        colorLbl.text = "Цвет текста"
        colorLbl.textAlignment = .center
        colorLbl.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(colorLbl)
        
        boldBigBtn.frame = CGRect(x: 200, y: 705, width: 35, height: 35)
        boldBigBtn.setTitle("AA", for: .normal)
        boldBigBtn.setTitleColor(.black, for: .normal)
        boldBigBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        boldBigBtn.layer.borderWidth = 1.0
        boldBigBtn.layer.borderColor = (UIColor.black.cgColor)
        boldBigBtn.addTarget(self, action: #selector(normalAndBoldText(sender:)), for: .touchUpInside)
        view.addSubview(boldBigBtn)
        
        boldSmallBtn.frame = CGRect(x: 200, y: 755, width: 35, height: 35)
        boldSmallBtn.setTitle("Aa", for: .normal)
        boldSmallBtn.setTitleColor(.black, for: .normal)
        boldSmallBtn.layer.borderWidth = 1.0
        boldSmallBtn.layer.borderColor = (UIColor.black.cgColor)
        boldSmallBtn.addTarget(self, action: #selector(normalAndBoldText(sender:)), for: .touchUpInside)
        view.addSubview(boldSmallBtn)
        
        // Когла клавиатура покажется
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(param:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        // Когда клавиатура показана
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(param:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }

    
    
// MARK: Создание TextView на экране
    fileprivate func createTextView() {
           textView.frame = CGRect(x: 0, y: 140, width: self.view.bounds.width - 20, height: 450)
           textView.backgroundColor = .secondarySystemBackground
           textView.center.x = view.center.x
           textView.text = """
           Последние слова Стива Джобса
           (основателя компании Apple)
           Он умер миллиардером в возрасте 56 лет
           от рака поджелудочной железы
           И вот его некоторые последние слова:
           
           «Я достиг пика успеха в деловом мире,
           в глазах других моя жизнь является сущностью успеха.
           
           Однако, кроме работы, у меня мало радости.
           В конце концов, богатство — это просто факт жизни,
           к которому я привык.
           
           В этот момент, когда я лежу в кровати больной
           и вспоминаю всю свою жизнь,
           я понимаю, что всё признание и богатство,
           которые у меня есть,
           бессмысленны и лишены высшего смысла
           перед лицом неминуемой смерти.
           """
           textView.font = UIFont.systemFont(ofSize: 20)
           view.addSubview(textView)
       }
    
    
// MARK: Создание Иконки День/Ночь возле switch
    fileprivate func createImageSwitch() {
        imageViewSwitch.frame = CGRect(x: 280, y: 100, width: 30, height: 30)
        imageViewSwitch.contentMode = .scaleAspectFill
        imageViewSwitch.image = UIImage(named: "moon")
        view.addSubview(imageViewSwitch)
    }
 
// MARK: Создание Slider
    fileprivate func createSlider() {
           slider.frame = CGRect(x: 0, y: 610, width: 300, height: 50)
           slider.center.x = view.center.x
           slider.minimumValue = 10
           slider.maximumValue = 50
           slider.value = 20
           slider.addTarget(self, action: #selector(sliderChanged(sender:)), for: .valueChanged)
           view.addSubview(slider)
       }
    
// MARK: Текст размера для слайдера
    fileprivate func createSizeLblOnSlider() {
        sizeLbl.frame = CGRect(x: 0, y: 590, width: 50, height: 30)
        sizeLbl.text = "20"
        sizeLbl.center.x = view.center.x
        view.addSubview(sizeLbl)
    }
    
// MARK: Greate Switch
    fileprivate func createSwitch() {
        mySwitch.frame = CGRect(x: 320, y: 100, width: 100, height: 80)
        mySwitch.addTarget(self, action: #selector(switchChanged(sender:)), for: .valueChanged)
        view.addSubview(mySwitch)
    }
    
// MARK: Create PickerView
    fileprivate func createPicker() {
        picker.dataSource = self
        picker.delegate = self
        picker.frame = CGRect(x: 20, y: 660, width: 150, height: 150)
        picker.tintColor = .systemGray
        view.addSubview(picker)
    }
    
    
// MARK: Создание Таргета для слайдера (Показывает размер текста и задает размер TextView)
    @objc func sliderChanged(sender: UISlider) {
        if sender == slider {
            sizeLbl.text = "\(Int(slider.value))"
        }
        let senderValue = CGFloat(slider.value)
        textView.font = UIFont(name: font , size: senderValue)
    }

// MARK: Меняет цвет текста в TextView
    @objc func colorText(sender: UIButton) {
        switch sender {
        case redBtn:
            textView.textColor = .red
        case blackbtn:
            textView.textColor = mySwitch.isOn ? .white : .black
        case greenBtn:
            textView.textColor = .green
        case blueBtn:
            textView.textColor = .blue
        default: break
        }
    }

// MARK: Меняет текс с нормального на жирный в TextView
    @objc func normalAndBoldText(sender: UIButton) {
        if sender.currentTitle == "Aa" {
            textView.font = UIFont.systemFont(ofSize: 20)
        } else if sender.currentTitle == "AA" {
            textView.font = UIFont.boldSystemFont(ofSize: 20)
        }
    }

// MARK: Изменение цвета День/Ночь при включении Switch
    @objc func switchChanged(sender: UISwitch) {
        if sender.isOn {
            self.view.backgroundColor = .black
            blackbtn.backgroundColor = .white
            textView.textColor = .white
            textView.backgroundColor = .black
            colorLbl.textColor = .white
            sizeLbl.textColor = .white
            boldBigBtn.setTitleColor(.white, for: .normal)
            boldBigBtn.layer.borderColor = (UIColor.white.cgColor)
            boldSmallBtn.setTitleColor(.white, for: .normal)
            boldSmallBtn.layer.borderColor = (UIColor.white.cgColor)
        } else {
            self.view.backgroundColor = .white
            blackbtn.backgroundColor = .black
            textView.backgroundColor = .secondarySystemBackground
            textView.textColor = .black
            colorLbl.textColor = .black
            sizeLbl.textColor = .black
            boldBigBtn.setTitleColor(.black, for: .normal)
            boldBigBtn.layer.borderColor = (UIColor.black.cgColor)
            boldSmallBtn.setTitleColor(.black, for: .normal)
            boldSmallBtn.layer.borderColor = (UIColor.black.cgColor)
        }
    }
    
// MARK: Скрывает клавиатуру при касании на любую область экрана
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
    }
  
// MARK: Создание захвата клавиатуры и работа с текс вью
    @objc func updateTextView(param: Notification) {
        // Захватываем значение об уведомлении
        let userInfo = param.userInfo
      
        // Получение всех координат и точек клавиатуры
        let getKeyboardRect = (userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        // Полученные координаты преобразует в другую систему координат вью
        let keyboardFrame = self.view.convert(getKeyboardRect, to: view.window)
        
        // КОгда клавиатура захочет скрыть уведомление
        if param.name == UIResponder.keyboardWillHideNotification {
            // вставка создержимого по 0 от каждого края
            textView.contentInset = UIEdgeInsets.zero
        } else {
            textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
             // Отслеживаение курсора на индикатор прокрутки
            textView.scrollIndicatorInsets = textView.contentInset
        }
        // Прокручивает получатель, пока не станет виден текст в указанном диапазоне (текущего textView)
        textView.scrollRangeToVisible(textView.selectedRange)
    }
    
}

// MARK: Расширение для PikerView
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        fontArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerFontLbl = UILabel()
        pickerFontLbl.text = fontArray[row]
        pickerFontLbl.textAlignment = .center
        pickerFontLbl.textColor = mySwitch.isOn ? .white : .black
        
        return pickerFontLbl
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == picker {
            font = fontArray[row]
            textView.font = UIFont(name: font, size: sizeText)
        }
    }
    
}
