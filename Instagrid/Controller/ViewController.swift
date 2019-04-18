//
//  ViewController.swift
//  Instagrid
//
//  Created by samahir adi on 02/04/2019.
//  Copyright © 2019 Syadesign. All rights reserved.
//

import UIKit
import Photos

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
    @IBOutlet weak var swipeUpView: UIView!
    
    var buttonNumber = 0
    
    
    
    func pickImage (button :UIButton, number :Int) {
        PHPhotoLibrary.requestAuthorization({status in
            if status == .authorized{
                DispatchQueue.main.async {
                    self.buttonNumber = number
                    self.imagePicker.sourceType = .photoLibrary
                    self.imagePicker.allowsEditing = true
                    self.present(self.imagePicker, animated: true, completion: nil)
                    button.isHidden = true
                }
            } else {
                self.alertAuthorization()
            }
        })
        
    }
    
    func alertAuthorization(){
        let alert = UIAlertController(title: "Accès bibliothèque", message: "Pour continuer, veuillez autoriser Instagrid à accéder à vos photos.", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let action2 = UIAlertAction(title: "Réglages", style: .default) { (action2) in
            self.accesSettings()
        }
        alert.addAction(action1)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)
    }
    
    func accesSettings(){
        if let url = NSURL(string: UIApplication.openSettingsURLString) as URL? {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
    }
    
    @IBAction func topLeftButton(_ sender: Any) {
        pickImage(button: topLeft, number: 1)
    }
    
    @IBAction func topRightButton(_ sender: Any) {
        pickImage(button: topRight, number: 2)
    }
    
    @IBAction func bottomLeftButton(_ sender: Any) {
        pickImage(button: bottomLeft, number: 3)
    }
    
    @IBAction func bottomRightButton(_ sender: Any) {
        pickImage(button: bottomRight, number: 4)
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
            if buttonNumber == 1 {
                imageTopLeft.contentMode = .scaleAspectFill
                imageTopLeft.image = image
            } else if buttonNumber == 2 {
                imageTopRight.contentMode = .scaleAspectFill
                imageTopRight.image = image
            } else if buttonNumber == 3 {
                imageBottomLeft.contentMode = .scaleAspectFill
                imageBottomLeft.image = image
            } else if buttonNumber == 4 {
                imageBottomRight.contentMode = .scaleAspectFill
                imageBottomRight.image = image
            }
        }
         dismiss(animated: true, completion: nil)
    }
    
   
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
        let direction = sender.direction
        if direction == .up {
            sharePicture()
        }
        
    }
    
    func sharePicture () {
        
    }
    
    }
    
    






