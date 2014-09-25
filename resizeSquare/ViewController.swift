//
//  ViewController.swift
//  resizeSquare
//
//  Created by 宮本幸子 on 2014/09/24.
//  Copyright (c) 2014年 Sachiko Miyamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let img = imageView.image
        imageView.image = img?.resizeSquare(resizeX: 260)
        
        let secImg = secondImageView.image
        secondImageView.image = secImg?.resizeSquare(resizeX: 260)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

