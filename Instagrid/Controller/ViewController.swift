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
    
    var gridView : GridView?

    @IBOutlet weak var logo: UIImageView!

    @IBOutlet weak var swipeIcon: UIImageView!
    
    @IBOutlet weak var swipeLabel: UILabel!
    
    
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
    
    @IBAction func ButtonModel1(_ sender: Any) {
    gridView?.setStyle(.model1)
    }
    
    @IBAction func ButtonModel2(_ sender: Any) {
        gridView?.setStyle(.model2)
    }
    
    @IBAction func ButtoModel3(_ sender: Any) {
        gridView?.setStyle(.model3)
    }
    
}
