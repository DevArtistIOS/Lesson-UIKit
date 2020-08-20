//
//  RegistrViewController.swift
//  ДЗ UILabel + UI TextField
//
//  Created by dream.one on 06.08.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class RegistrViewController: UIViewController, UITextFieldDelegate {

    let loginLbl = UILabel()
    let mailLbl = UILabel()
    let numberLbl = UILabel()
    let passwordLbl = UILabel()
    let checkLbl = UILabel()
    let loginBtn = UIButton()
    
    
    let loginTextField = UITextField()
    let mailTextFild = UITextField()
    let numberTextField = UITextField()
    let passwordTextField = UITextField()
    let pickerRegion = UIPickerView()
    var segmentControl = UISegmentedControl()
    
    var itemArrayForSegment = ["Вход", "Регистрация"]
    var dataUser = ["Login" : "Password"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Регистрация"
        
        createSegmentControl()
        
        loginTextField.frame = CGRect(x: 0, y: 325, width: 200, height: 30)
        loginTextField.borderStyle = .roundedRect
        loginTextField.placeholder = "Введите логин"
        loginTextField.center.x = view.center.x
        loginTextField.clearButtonMode = .always
        loginTextField.delegate = self
        view.addSubview(loginTextField)
        
        passwordTextField.frame = CGRect(x: 0, y: 385, width: 200, height: 30)
        passwordTextField.borderStyle = .roundedRect
        //passwordTextField.keyboardType = .numberPad
        passwordTextField.center.x = view.center.x
        passwordTextField.isSecureTextEntry = true
        passwordTextField.clearButtonMode = .always
        passwordTextField.placeholder = "Введите пароль"
        passwordTextField.delegate = self
        view.addSubview(passwordTextField)
        
        mailTextFild.frame = CGRect(x: 0, y: 445, width: 200, height: 30)
        mailTextFild.borderStyle = .roundedRect
        mailTextFild.placeholder = "Введите mail"
        mailTextFild.center.x = view.center.x
        mailTextFild.keyboardType = .emailAddress
        mailTextFild.clearButtonMode = .always
        mailTextFild.delegate = self
        view.addSubview(mailTextFild)
        
        numberTextField.frame = CGRect(x: 0, y: 505, width: 200, height: 30)
        numberTextField.borderStyle = .roundedRect
        numberTextField.placeholder = "Введите номер:"
        numberTextField.keyboardType = .phonePad
        numberTextField.center.x = view.center.x
        numberTextField.clearButtonMode = .always
        numberTextField.delegate = self
        view.addSubview(numberTextField)
        
        
        
        loginLbl.frame = CGRect(x: 110, y: 300, width: 100, height: 20)
        loginLbl.text = "Логин"
        loginLbl.textColor = .black
        view.addSubview(loginLbl)
        
        passwordLbl.frame = CGRect(x: 110, y: 360, width: 100, height: 20)
        passwordLbl.text = "Пароль"
        passwordLbl.textColor = .black
        view.addSubview(passwordLbl)
        
        mailLbl.frame = CGRect(x: 110, y: 420, width: 100, height: 20)
        mailLbl.text = "Email"
        mailLbl.textColor = .black
        view.addSubview(mailLbl)
        
        numberLbl.frame = CGRect(x: 110, y: 480, width: 150, height: 20)
        numberLbl.text = "Номер телефона"
        numberLbl.textColor = .black
        view.addSubview(numberLbl)
        
        checkLbl.frame = CGRect(x: 0, y: 130, width: 300, height: 150)
        checkLbl.center.x = view.center.x
        checkLbl.adjustsFontSizeToFitWidth = true
        checkLbl.textAlignment = .center
        checkLbl.textColor = .red
        checkLbl.numberOfLines = 0
        checkLbl.lineBreakMode = .byWordWrapping
        checkLbl.font = UIFont.boldSystemFont(ofSize: 22)
        view.addSubview(checkLbl)
        
        
        loginBtn.frame = CGRect(x: 0, y: 550, width: 200, height: 40)
        loginBtn.setTitle("Войти", for: .normal)
        loginBtn.center.x = view.center.x
        loginBtn.layer.cornerRadius = 15
        loginBtn.backgroundColor = .black
        loginBtn.addTarget(self, action: #selector(loginUserBtnChanged), for: .touchUpInside)
        view.addSubview(loginBtn)
        
        
        
        mailTextFild.isHidden = true
        numberTextField.isHidden = true
        mailLbl.isHidden = true
        numberLbl.isHidden = true

// MARK: При нажатии на TextField клавиатура выезжает вверх вместе с экраном
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -100
        }

// MARK: При нажатии на ВВод все возвращается на свои места
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0
        }
        
    }

// MARK: Создание Сегмента для режима Вход/Регистрация
    fileprivate func createSegmentControl() {
        segmentControl = UISegmentedControl(items: itemArrayForSegment)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.frame = CGRect(x: 0, y: 250, width: 200, height: 35)
        segmentControl.center.x = view.center.x
        segmentControl.backgroundColor = .white
        segmentControl.selectedSegmentTintColor = .systemBlue
        segmentControl.addTarget(self, action: #selector(segmentChanged(sender:)), for: .valueChanged)
        view.addSubview(segmentControl)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func segmentChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mailTextFild.isHidden = true
            numberTextField.isHidden = true
            mailLbl.isHidden = true
            numberLbl.isHidden = true
            loginBtn.setTitle("Войти", for: .normal)
            cleatTextField()
         case 1:
            mailTextFild.isHidden = false
            numberTextField.isHidden = false
            mailLbl.isHidden = false
            numberLbl.isHidden = false
            loginBtn.setTitle("Зарегистрироваться", for: .normal)
            cleatTextField()
        default: break
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField && mailTextFild.isHidden == false {
            mailTextFild.becomeFirstResponder()
        } else if mailTextFild.isHidden == false && numberTextField.isHidden == false {
            numberTextField.becomeFirstResponder()
        } else if textField == numberTextField {
            textField.resignFirstResponder()
        } else if textField == passwordTextField {
            textField.resignFirstResponder()
        }
        return true
    }
    
    @objc func loginUserBtnChanged() {
        if loginTextField.text?.isEmpty == true || passwordTextField.text?.isEmpty == true {
            alertTextField()
        }
 // Проверка данных при входе
        if segmentControl.selectedSegmentIndex == 0 {
            for (login, password) in dataUser {
                if loginTextField.text == login && passwordTextField.text == password {
                    checkLbl.text = "Вход выполнен"
                    break
                } else if loginTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false {
                    checkLbl.text = "Проверьте правильность ввода"
                }
            }
// Сохранение данных в словаь
        } else if segmentControl.selectedSegmentIndex == 1 {
            dataUser.updateValue(passwordTextField.text ?? "nil", forKey: loginTextField.text ?? "nil")
            print(dataUser)
        }
    }
    
    
    func alertTextField() {
        let alert = UIAlertController(title: "Внимание!", message: "Заполните все поля", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func cleatTextField() {
        loginTextField.text = ""
        passwordTextField.text = ""
    }

}
