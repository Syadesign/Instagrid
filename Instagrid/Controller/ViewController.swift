//
//  ViewController.swift
//  Instagrid
//
//  Created by samahir adi on 02/04/2019.
//  Copyright © 2019 Syadesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    
    func pickImage (button : UIButton) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        button.isHidden = true
    }
    
    @IBAction func topLeftButton(_ sender: Any) {
        pickImage(button: topLeft)
    }
    
    @IBAction func topRightButton(_ sender: Any) {
        pickImage(button: topRight)
    }
    
    @IBAction func bottomLeftButton(_ sender: Any) {
      pickImage(button: bottomLeft)
    }
    
    @IBAction func bottomRightButton(_ sender: Any) {
        pickImage(button: bottomRight)
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
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage ] as? UIImage {
            imageTopLeft.image = image
            imageTopRight.image = image
            imageBottomRight.image = image
            imageBottomLeft.image = image
            }
         dismiss(animated: true, completion: nil)
        }
        
    
    }
    




