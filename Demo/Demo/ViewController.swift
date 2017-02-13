//
//  ViewController.swift
//  Demo
//
//  Created by Taillook on 2017/02/12.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let Graph = LineGraph(frame: CGRect(x: 20, y: 20, width: 250, height: 250), xData: [1,2,3,4,5], yData: [5,2,6,1,9])
        self.view.addSubview(Graph)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

