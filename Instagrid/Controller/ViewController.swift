//
//  ViewController.swift
//  Instagrid
//
//  Created by samahir adi on 02/04/2019.
//  Copyright © 2019 Syadesign. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        // Make the 4 UIImageViews clikable in the grid to change the image
        let tapImage1 = UITapGestureRecognizer(target: self, action: #selector(topLeftButton(_:)))
        tapImage1.delegate = self
        let tapImage2 = UITapGestureRecognizer(target: self, action: #selector(topRightButton(_:)))
        tapImage2.delegate = self
        let tapImage3 = UITapGestureRecognizer(target: self, action: #selector(bottomLeftButton(_:)))
        tapImage3.delegate = self
        let tapImage4 = UITapGestureRecognizer(target: self, action: #selector(bottomRightButton(_:)))
        tapImage4.delegate = self
        self.imageTopLeft.addGestureRecognizer(tapImage1)
        self.imageTopLeft.isUserInteractionEnabled = true
        self.imageTopRight.addGestureRecognizer(tapImage2)
        self.imageTopRight.isUserInteractionEnabled = true
        self.imageBottomLeft.addGestureRecognizer(tapImage3)
        self.imageBottomLeft.isUserInteractionEnabled = true
        self.imageBottomRight.addGestureRecognizer(tapImage4)
        self.imageBottomRight.isUserInteractionEnabled = true
        
    }
    
    func  imageClikable() {
        
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
    
    
    /// Request authorization to access the user library and choose a picture
    @objc func pickImage (button :UIButton, number :Int) {
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
    
    /// Display an alert if the access to the library is not authorized. The user can cancel the operation or go to is settings to authorize the access
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
    
    /// access the application settings
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
    
    /// add a picture from the user library
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
    
    






