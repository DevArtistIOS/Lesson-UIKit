//
//  DataManager.swift
//  ДЗ UIProgressView (Прогрузка картинок)
//
//  Created by dream.one on 26.08.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class DataManager {

    static let nameImage = "saveImage"
    
    static var userImage: UIImage? {
        get {
            guard let imageData = UserDefaults.standard.data(forKey: DataManager.nameImage) else {return nil}
            return UIImage(data: imageData)
        }
        set {
            guard let newImage = newValue else {return}
            guard let imageData = newImage.pngData() else {return}
            UserDefaults.standard.set(imageData, forKey: DataManager.nameImage)
            UserDefaults.standard.synchronize()
        }
    }
    

}
