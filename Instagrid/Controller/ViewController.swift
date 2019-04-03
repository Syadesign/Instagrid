//
//  ViewController.swift
//  Instagrid
//
//  Created by samahir adi on 02/04/2019.
//  Copyright © 2019 Syadesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func choice1(_ sender: Any) {
        setModel(.model1)
    }
    
    @IBAction func choice2(_ sender: Any) {
        setModel(.model2)
    }
    
    @IBAction func choice3(_ sender: Any) {
        setModel(.model3)
    }
    
    
    

    
}

