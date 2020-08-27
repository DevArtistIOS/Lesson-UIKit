//
//  ViewController.swift
//  ДЗ UIProgressView (Прогрузка картинок)
//
//  Created by dream.one on 25.08.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var progressView = UIProgressView(progressViewStyle: .bar)
    private let imageView = UIImageView()
    private var time = Timer()
    private var myImage = UIImage(named: "1")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        createImageView(imageView)
        createProgressView(progressView)
        createTimer()
    }
    
// MARK: Create Timer
    
   private func createTimer() {
        time = Timer.scheduledTimer(timeInterval: 1,
                                    target: self,
                                    selector: #selector(updateTimer),
                                    userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if progressView.progress != 1.0 {
            progressView.progress += 0.2 / 1.0
            imageView.alpha += 0.2 / 1.0
        } else if progressView.progress == 1.0 {
            UIView.animate(withDuration: 0.5) {
                self.time.invalidate()
                let imageVc = ImageViewController()
                imageVc.modalPresentationStyle = .fullScreen
                self.present(imageVc, animated: true, completion: nil)
            }
            
            
        }
    }
    
// MARK: Создаем ImageView on View
    
   private func createImageView(_ image: UIImageView) {
        image.frame = CGRect(x: 0, y: 120,
                             width: Int(view.bounds.width),
                             height: 650)
        if let newImage = DataManager.userImage {
            image.image = newImage
        } else {
            image.image = myImage
        }

        image.contentMode = .scaleAspectFill
        image.alpha = 0.1
        view.addSubview(image)
    }
 
// MARK: Create ProgressView on View
    
   private func createProgressView(_ progress: UIProgressView) {
        progressView.frame = CGRect(x: Int(view.center.x) - 100, y: Int(view.center.y) + 400, width: 200, height: 80)
        progressView.alpha = 1.0
        progressView.tintColor = .systemBlue
        progressView.progressTintColor = .systemGray
        view.addSubview(progressView)
    }

}

