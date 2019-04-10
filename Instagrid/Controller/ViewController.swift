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
    @IBOutlet weak var imageTopLeft: UIImageView!
    @IBOutlet weak var imageTopRight: UIImageView!
    @IBOutlet weak var imageBottomLeft: UIImageView!
    @IBOutlet weak var imageBottomRight: UIImageView!
    
    
    @IBOutlet weak var bottomRight: UIButton!
    @IBOutlet weak var bottomLeft: UIButton!
    @IBOutlet weak var topRight: UIButton!
    @IBOutlet weak var topLeft: UIButton!
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var selected1: UIImageView!
    @IBOutlet weak var selected2: UIImageView!
    @IBOutlet weak var selected3: UIImageView!
    
    
    @IBAction func topLeftButton(_ sender: Any) {
    }
    
    @IBAction func topRightButton(_ sender: Any) {
    }
    
    @IBAction func bottomLeftButton(_ sender: Any) {
    }
    
    @IBAction func bottomRightButton(_ sender: Any) {
    }
    

    func selected(style: GridView.Style) {
        gridView?.style = style
        selected1.isHidden = style != .model1
        selected2.isHidden = style != .model2
        selected3.isHidden = style != .model3
    }
    
    @IBAction func ButtonModel1(_ sender: Any) {
        selected(style: .model1)
    }
    
    @IBAction func ButtonModel2(_ sender: Any) {
        selected(style: .model2)
    }
    
    @IBAction func ButtoModel3(_ sender: Any) {
        selected(style: .model3)
    }
    
}
