//
//  ViewController.swift
//  ДЗ UIImage + UIScrollView
//
//  Created by dream.one on 16.08.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var imageView1 = UIImageView()
    var imageView2 = UIImageView()
    var imageView3 = UIImageView()
    var imageView4 = UIImageView()
    var imageView5 = UIImageView()
    var imageView6 = UIImageView()
    
    let imageArray = [  UIImage(named: "1"),
                        UIImage(named: "2"),
                        UIImage(named: "3"),
                        UIImage(named: "4"),
                        UIImage(named: "5"),
                        UIImage(named: "6")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Фото редактор"
//
//        imageView1.frame = CGRect(x: 50, y: 200, width: 100, height: 100)
//        imageView1.image = imageArray[0]
//        imageView1.contentMode = .scaleAspectFill
//        view.addSubview(imageView1)
//
//        imageView2.frame = CGRect(x: 265, y: 200, width: 100, height: 100)
//        imageView2.image = imageArray[1]
//        imageView2.contentMode = .scaleAspectFill
//        view.addSubview(imageView2)
//
//        imageView3.frame = CGRect(x: 50, y: 350, width: 100, height: 100)
//        imageView3.image = imageArray[2]
//        imageView3.contentMode = .scaleAspectFill
//        view.addSubview(imageView3)
//
//        imageView4.frame = CGRect(x: 265, y: 350, width: 100, height: 100)
//        imageView4.image = imageArray[3]
//        imageView4.contentMode = .scaleAspectFill
//        view.addSubview(imageView4)
//
//        imageView5.frame = CGRect(x: 50, y: 500, width: 100, height: 100)
//        imageView5.image = imageArray[4]
//        imageView5.contentMode = .scaleAspectFill
//        view.addSubview(imageView5)


        let yOffset = 10

        let navBarHeight = UIApplication.shared.statusBarFrame.height +  (navigationController?.navigationBar.frame.size.height ?? 0) + 10
        let tabBarHeight = tabBarController?.tabBar.frame.height ?? 0
        let deviceHeight = view.frame.size.height - navBarHeight - tabBarHeight
        let imageHeight = (Int(deviceHeight) - imageArray.count * yOffset) / imageArray.count

        imageArray.enumerated().forEach { index, image in
            let imageNumber = CGFloat(index)

            let imageView = UIImageView(image: image)
            imageView.isUserInteractionEnabled = true
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(
                x: 10,
                y: navBarHeight + imageNumber * CGFloat(imageHeight + yOffset),
                width: view.frame.size.width - 20,
                height: CGFloat(imageHeight)
            )

            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapImage))
            imageView.addGestureRecognizer(tapGesture)

            view.addSubview(imageView)
        }
        
    }
    
    @objc func tapImage(gesture: UITapGestureRecognizer) {
        guard let imageView = gesture.view as? UIImageView, let image = imageView.image else {
            return
        }
        
        let imageVC = ImageViewController()
        imageVC.imageNew = image
        self.navigationController?.pushViewController(imageVC, animated: true)
        
    }
}

