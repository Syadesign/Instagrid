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

    @IBOutlet weak var logo: UIImageView!

    @IBOutlet weak var swipeIcon: UIImageView!
    
    @IBOutlet weak var swipeLabel: UILabel!
    
    @IBOutlet weak var gridView: GridView!
    
    @IBOutlet weak var bottomRight: UIButton!
    @IBOutlet weak var bottomLeft: UIButton!
    @IBOutlet weak var topRight: UIButton!
    @IBOutlet weak var topLeft: UIButton!
    
    
    @IBAction func topLeftButton(_ sender: Any) {
    }
    
    @IBAction func topRightButton(_ sender: Any) {
    }
    
    @IBAction func bottomLeftButton(_ sender: Any) {
    }
    
    @IBAction func bottomRightButton(_ sender: Any) {
    }
    
    enum Style {
        case model1, model2, model3
    }
    
    private func setStyle(_ style: Style) {
        switch style {
        case .model1:
            topLeft.isHidden = true
        case .model2:
            bottomLeft.isHidden = true
        case .model3:
            topLeft.isHidden = false
        }
    }

    @IBAction func buttonModel1(_ sender: Any) {
        setStyle(.model1)
    }
    
    @IBAction func buttonModel2(_ sender: Any) {
        setStyle(.model2)
    }
    
    @IBAction func buttonModel3(_ sender: Any) {
        setStyle(.model3)
    }
}

