//
//  TimerViewController.swift
//  ДЗ TextView + Button
//
//  Created by dream.one on 12.08.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    let startPauseBtn = UIButton()
    let stopBtn = UIButton()
    var timer = Timer()
    
    var timerStart: TimeInterval = 0.0
    var timerSave: TimeInterval = 0.0

    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Секундомер"
        
        
        label.frame = CGRect(x: 0, y: 200, width: 300, height: 250)
        label.center.x = view.center.x
        label.text = "00:00:00"
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.textAlignment = .center
        view.addSubview(label)
        
        startPauseBtn.frame = CGRect(x: 0, y: 500, width: 70, height: 70)
        startPauseBtn.center.x = view.center.x
        startPauseBtn.setImage(UIImage(named: "play"), for: .normal)
        startPauseBtn.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        view.addSubview(startPauseBtn)
        
        stopBtn.frame = CGRect(x: 0, y: 600, width: 70, height: 70)
        stopBtn.center.x = view.center.x
        stopBtn.setImage(UIImage(named: "clock"), for: .normal)
        stopBtn.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        view.addSubview(stopBtn)
        
        stopBtn.isHidden = true
 
    }
    

    @objc func startTimer(sender: UIButton) {
        if sender.currentImage == UIImage(named: "play") {
            startPauseBtn.setImage(UIImage(named: "pause"), for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(hasTimer), userInfo: nil, repeats: true)
            timerStart = Date.timeIntervalSinceReferenceDate
            stopBtn.isHidden = true
        } else if sender.currentImage == UIImage(named: "pause") {
            startPauseBtn.setImage(UIImage(named: "play"), for: .normal)
            let cuttentTime = Date.timeIntervalSinceReferenceDate
            timerSave += cuttentTime - timerStart
            stopBtn.isHidden = false
            timer.invalidate()
        }
    }
    
// MARK: Остановка и обнуление таймера по кнопке стоп
    @objc func stopTimer() {
        timerStart = 0.0
        timerSave = 0.0
        label.text = "00:00:00"
        timer.invalidate()
    }
    
    @objc func hasTimer() {
        // Обновляем до текущего времени
        let cuttentTime = Date.timeIntervalSinceReferenceDate
        // Вычисляем прошеднее время
        let timerElapsedTime: TimeInterval = (cuttentTime - timerStart) + timerSave
        
        // Преобразуем прошедшее время в минуты, секунды и часы.
        let hours = Int(timerElapsedTime / 3600)
        let minutes = Int((timerElapsedTime) / 60) % 60
        let seconds = Int(timerElapsedTime) % 60
        label.text = NSString(format: "%02d:%02d:%02d", hours, minutes, seconds) as String
    }
    
}
