//
//  ImageViewController.swift
//  ДЗ UIProgressView (Прогрузка картинок)
//
//  Created by dream.one on 25.08.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    private var imageView1 = UIImageView()
    private var imageView2 = UIImageView()
    private var imageView3 = UIImageView()
    private var imageView4 = UIImageView()
    private var imageView5 = UIImageView()
    private var imageView6 = UIImageView()
    private var scrollView = UIScrollView()
    
    private let imageArray = [UIImage(named: "1"),
    UIImage(named: "2"),
    UIImage(named: "3"),
    UIImage(named: "4"),
    UIImage(named: "5"),
    UIImage(named: "6"),
    UIImage(named: "7")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        createScrollView()
        setupImageViewOnView()

    }
    
// MARK: Создаем установщик ImageView с координатами на View
  private func createImageView(x: Int, y: Int, image: UIImage?) -> UIImageView {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: x, y: y, width: 180, height: 300)
        imageView.image = image
        imageView.contentMode = .scaleToFill
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapImage(_:)))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
        view.addSubview(imageView)
        scrollView.addSubview(imageView)
        
        return imageView
    }
    
// MARK: Селектор для UITapGestureRecognizer и прикосновения для смены ImageView
    @objc func tapImage(_ sender: UITapGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else {return}
        guard let image = imageView.image else {return}
        DataManager.userImage = image
        
        let firstVc = ViewController()
        firstVc.modalPresentationStyle = .fullScreen
        self.present(firstVc, animated: true, completion: nil)
        
    }
    
// MARK: Наносим все ImageView согласно координатам и UIImage
    fileprivate func setupImageViewOnView() {
           imageView1 = createImageView(x: 20, y: 30, image: imageArray[1])
           imageView2 = createImageView(x: 214, y: 30, image: imageArray[2])
           imageView3 = createImageView(x: 20, y: 350, image: imageArray[3])
           imageView4 = createImageView(x: 214, y: 350, image: imageArray[4])
           imageView5 = createImageView(x: 20, y: 670, image: imageArray[5])
           imageView6 = createImageView(x: 214, y: 670, image: imageArray[6])
       }
    
// MARK: Добавляем ScrollView для прокрутки картинок
    fileprivate func createScrollView() {
        let scrollFrame = self.view.bounds
        scrollView = UIScrollView(frame: scrollFrame)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: (view.bounds.height + CGFloat((imageArray.count * 30))))
        view.addSubview(scrollView)
    }

}
