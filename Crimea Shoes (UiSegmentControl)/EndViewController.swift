//
//  EndViewController.swift
//  Crimea Shoes (UiSegmentControl)
//
//  Created by dream.one on 14.07.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {

    @IBOutlet weak var endLbl: UILabel!
    @IBOutlet weak var okImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        okImage.image = UIImage(systemName: "checkmark.shield.fill")
    }
    

    @IBAction func endBtnToShop(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    
}
