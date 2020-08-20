//
//  ImageViewController.swift
//  ДЗ UIImage + UIScrollView
//
//  Created by dream.one on 16.08.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    let slider = UISlider()
    let picker = UIPickerView()
    var imageNew = UIImage()
    var imageView = UIImageView()
    
    var contenModeArray = ["scaleAspectFit", "scaleToFill", "scaleAspectFill", "redraw", "center", "top", "bottom", "left", "right", "topLeft", "topRight", "bottomLeft", "bottomRigth"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Фото"
        self.view.backgroundColor = .white
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 150, width: self.view.bounds.width - 10, height: 250))
        imageView.center.x = view.center.x
        imageView.image = imageNew
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        slider.frame = CGRect(x: 0, y: view.bounds.height - 350, width: (view.bounds.width - 40), height: 40)
        slider.center.x = view.center.x
        slider.addTarget(self, action: #selector(sliderChanged(target:)), for: .valueChanged)
        view.addSubview(slider)
        
        picker.delegate = self
        picker.frame = CGRect(x: 0, y: view.bounds.height - 300, width: view.bounds.width - 90, height: 150)
        picker.center.x = view.center.x
        view.addSubview(picker)
    
    }
    
    @objc func sliderChanged(target: UISlider) {
        if target == slider {
            let currentAlpha = CGFloat(target.value)
            imageView.alpha = (1 - currentAlpha)
        }
    }

}

extension ImageViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        contenModeArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let mode = UIView.ContentMode(rawValue: row) {
            imageView.contentMode = mode
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return contenModeArray[row]
    }
    
    
}
