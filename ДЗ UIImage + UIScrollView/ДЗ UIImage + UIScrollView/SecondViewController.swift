//
//  SecondViewController.swift
//  ДЗ UIImage + UIScrollView
//
//  Created by dream.one on 16.08.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate  {

    var avaImageView = UIImageView()
    let imagePicker = UIImagePickerController()
    let addPhotoBtn = UIButton()
    
    var genderSegment = UISegmentedControl()
    let nameTextField = UITextField()
    let familyTextField = UITextField()
    let mailTextField = UITextField()
    let numberTextField = UITextField()
    let dateTextField = UITextField()

    var myScroll = UIScrollView()
    var arrayGender = ["мужской", "женский"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Анкета регистрации"
        
        let scrollFrame = self.view.bounds
        myScroll = UIScrollView(frame: scrollFrame)
        myScroll.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + 300)
        myScroll.bounces = true
        view.addSubview(myScroll)
        
        imagePicker.delegate = self
        
        createAddPhotoBtn()
        createImageView()
        createNameTextField()
        createFamilyTextField()
        createDateTextField()
        createMailTextField()
        createNumberTextField()
        createSegmentControlGender()
        
        
       
// MARK: Узнаем, когда клавиатура появится и двигается по смены вводимого значения
        NotificationCenter.default.addObserver(self, selector: #selector(updateViewForScroll(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        
// MARK: Узнаем, когда клавиатура исчезнет
        NotificationCenter.default.addObserver(self, selector: #selector(updateViewForScroll(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            self.myScroll.frame.origin.y = -100
        }
        
    }
    
    // MARK: Скрытие клавиатуры при нажатии в любое место экрана
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
   
// MARK: Создание ImageView for View
    fileprivate func createImageView() {
        avaImageView = UIImageView(frame: CGRect(x: 0, y: Int(view.bounds.height - 800), width: 150, height: 150))
        avaImageView.center.x = view.center.x
        avaImageView.layer.cornerRadius = avaImageView.frame.height/2
        //avaImageView.backgroundColor = .secondarySystemBackground
        avaImageView.clipsToBounds = true
        avaImageView.layer.borderWidth = 2.0
        avaImageView.layer.borderColor = UIColor.systemRed.cgColor
        avaImageView.contentMode = .scaleAspectFill
        view.addSubview(avaImageView)
        myScroll.addSubview(avaImageView)
    }
    
// MARK: Создание кнопки для загрузки фото из галереи и камеры
    fileprivate func createAddPhotoBtn() {
        addPhotoBtn.frame = CGRect(x: 0, y: 100, width: 150, height: 150)
        addPhotoBtn.center.x = view.center.x
        addPhotoBtn.setImage(UIImage(named: "camera"), for: .normal)
        addPhotoBtn.addTarget(self, action: #selector(tapOnImage(_:)), for: .touchUpInside)
        view.addSubview(addPhotoBtn)
        myScroll.addSubview(addPhotoBtn)
    }
    
    fileprivate func createNameTextField() {
        nameTextField.frame = CGRect(x: 0, y: Int(view.bounds.height - 600), width: 250, height: 44)
        nameTextField.tag = 0
        nameTextField.center.x = view.center.x
        nameTextField.layer.cornerRadius = 10
        nameTextField.placeholder = " Введите имя"
        nameTextField.textAlignment = .center
        nameTextField.backgroundColor = .secondarySystemBackground
        nameTextField.delegate = self
        myScroll.addSubview(nameTextField)
    }
    
fileprivate func createFamilyTextField() {
       familyTextField.frame = CGRect(x: 0, y: Int(view.bounds.height - 500), width: 250, height: 44)
       familyTextField.tag = 1
       familyTextField.center.x = view.center.x
       familyTextField.layer.cornerRadius = 10
       familyTextField.placeholder = " Введите фамилию"
       familyTextField.textAlignment = .center
       familyTextField.backgroundColor = .secondarySystemBackground
       familyTextField.delegate = self
       myScroll.addSubview(familyTextField)
   }
    
    
    fileprivate func createDateTextField() {
        dateTextField.frame = CGRect(x: 0, y: Int(view.bounds.height - 400), width: 250, height: 44)
        dateTextField.tag = 2
        dateTextField.center.x = view.center.x
        dateTextField.layer.cornerRadius = 10
        dateTextField.placeholder = " Введите дату рождения"
        dateTextField.textAlignment = .center
        dateTextField.backgroundColor = .secondarySystemBackground
        dateTextField.delegate = self
        myScroll.addSubview(dateTextField)
    }
    
    fileprivate func createMailTextField() {
        mailTextField.frame = CGRect(x: 0, y: Int(view.bounds.height - 200), width: 250, height: 44)
        mailTextField.tag = 3
        mailTextField.center.x = view.center.x
        mailTextField.layer.cornerRadius = 10
        mailTextField.placeholder = " Введите email"
        mailTextField.textAlignment = .center
        mailTextField.backgroundColor = .secondarySystemBackground
        mailTextField.keyboardType = .emailAddress
        mailTextField.delegate = self
        myScroll.addSubview(mailTextField)
    }
    
    
    fileprivate func createNumberTextField() {
        numberTextField.frame = CGRect(x: 0, y: Int(view.bounds.height - 100), width: 250, height: 44)
        numberTextField.tag = 4
        numberTextField.center.x = view.center.x
        numberTextField.layer.cornerRadius = 10
        numberTextField.placeholder = " Введите номер"
        numberTextField.textAlignment = .center
        numberTextField.backgroundColor = .secondarySystemBackground
        numberTextField.keyboardType = .numberPad
        numberTextField.delegate = self
        myScroll.addSubview(numberTextField)
    }
    
    
    fileprivate func createSegmentControlGender() {
        genderSegment = UISegmentedControl(items: arrayGender)
        genderSegment.frame = CGRect(x: 0, y: Int(view.bounds.height - 300), width: 200, height: 30)
        genderSegment.center.x = view.center.x
        genderSegment.backgroundColor = .secondarySystemBackground
        genderSegment.selectedSegmentTintColor = .systemBlue
        //view.addSubview(genderSegment)
        myScroll.addSubview(genderSegment)
    }
    
    
// MARK: Alert для смены аватарки
    @objc func tapOnImage(_ sender: UIGestureRecognizer) {
        let alert = UIAlertController(title: "Выбрать изобрадение", message: nil, preferredStyle: .actionSheet)
        // Создаем Экшен Галерея
        let alertPhoto = UIAlertAction(title: "Галерея", style: .default) { (alert) in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        // Создаем Экшен Камера
        let alertCamera = UIAlertAction(title: "Камера", style: .default) { (alert) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        // Создаем Экшн Отмена
        let alertCancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addAction(alertPhoto)
        alert.addAction(alertCamera)
        alert.addAction(alertCancel)
        present(alert, animated: true, completion: nil)
    }
    

    
// MARK: Действия ScrollView при появлении клавиатуры
    @objc func updateViewForScroll(_ param: Notification) {
        let userInfo = param.userInfo
// Получение координат клавиатуры
        let keyboardRect = (userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardFrame = view.convert(keyboardRect, to: view.window)
// Если клавиатура выбирается, возвращаем nil, если же появляется поднимаем на высоту клавиатуры
        if param.name == UIResponder.keyboardWillHideNotification {
            self.myScroll.frame.origin.y = 0
            myScroll.contentInset = UIEdgeInsets.zero
        } else {
            myScroll.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
            // Скролим, чтобы курсор был на на нужном месте
            myScroll.scrollIndicatorInsets = myScroll.contentInset
        }
    }
    
    
   // MARK: Реализация делегата для TextField при нажатии на Return перепрыгивает на новый TextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            familyTextField.becomeFirstResponder()
        case familyTextField:
            dateTextField.becomeFirstResponder()
        case dateTextField:
            mailTextField.becomeFirstResponder()
        case mailTextField:
            numberTextField.becomeFirstResponder()
        case numberTextField:
            numberTextField.resignFirstResponder()
        default:
            break
        }
        return true
    }

}

// MARK: Реализация делегата для загрузки картинки, если она приходит - установить на Аватарку (ориг - целая картинка, edit - уже отредактировання)
extension SecondViewController: UIImagePickerControllerDelegate,  UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            avaImageView.image = pickedImage
        }
         self.dismiss(animated: true, completion: nil)
    }
    

}
