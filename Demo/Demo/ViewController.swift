//
//  ViewController.swift
//  Demo
//
//  Created by Taillook on 2017/02/12.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var graph: LineGraph!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        graph.xData = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D"]
        graph.yData = [0,10,20,30,20,10,5,5,5,5,1,2,3,4,5,6,7,8,9,10,20,21,22,23,24,25,26,27,28,29]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
