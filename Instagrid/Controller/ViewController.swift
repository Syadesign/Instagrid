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
    

    @IBOutlet weak var gridView: GridView!
    
    @IBOutlet weak var logo: UIImageView!

    @IBOutlet weak var swipeIcon: UIImageView!
    
    @IBOutlet weak var swipeLabel: UILabel!
    
    @IBOutlet var viewTopLeft :UIView?
    @IBOutlet var viewTopRight :UIView?
    @IBOutlet var viewBottomLeft :UIView?
    @IBOutlet var viewBottomRight :UIView?
    
    
    @IBOutlet weak var bottomRight: UIButton!
    @IBOutlet weak var bottomLeft: UIButton!
    @IBOutlet weak var topRight: UIButton!
    @IBOutlet weak var topLeft: UIButton!
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBAction func topLeftButton(_ sender: Any) {
    }
    
    @IBAction func topRightButton(_ sender: Any) {
    }
    
    @IBAction func bottomLeftButton(_ sender: Any) {
    }
    
    @IBAction func bottomRightButton(_ sender: Any) {
    }
    
    func standardStyle () {
        gridView.style = .model1
        button1.imageView?.isHidden = false
        button2.imageView?.isHidden = true
        button3.imageView?.isHidden = true
        
    }
    
    
    @IBAction func ButtonModel1(_ sender: Any) {
        gridView?.style = .model1
        button1.imageView?.isHidden = false
        button2.imageView?.isHidden = true
        button3.imageView?.isHidden = true
    }
    
    @IBAction func ButtonModel2(_ sender: Any) {
        gridView?.style = .model2
        button1.imageView?.isHidden = true
        button2.imageView?.isHidden = false
        button3.imageView?.isHidden = true
    }
    
    @IBAction func ButtoModel3(_ sender: Any) {
        gridView?.style = .model3
        button1.imageView?.isHidden = true
        button2.imageView?.isHidden = true
        button3.imageView?.isHidden = false
    }
    
}
