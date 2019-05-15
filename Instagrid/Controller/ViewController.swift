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
    
    var imageToShare = Image()
    var imagePicker = UIImagePickerController()
    
    let screenHeigh = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.maxX
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        self.gridButtonsArray = [topLeft, topRight, bottomLeft, bottomRight]
        self.gridImagesArray = [imageTopRight, imageTopLeft, imageBottomRight, imageBottomLeft]
        
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
        self.imageTopRight.addGestureRecognizer(tapImage2)
        self.imageBottomLeft.addGestureRecognizer(tapImage3)
        self.imageBottomRight.addGestureRecognizer(tapImage4)
        for i in gridImagesArray {
            i?.isUserInteractionEnabled = true
        }
        
        //Observe the device's rotation
        let didRotate: (Notification) -> Void = { notification in
            switch UIDevice.current.orientation {
            case .landscapeLeft, .landscapeRight:
                self.swipeLabel.text = "Swipe left to share"
                self.swipeUpIcon.image = #imageLiteral(resourceName: "swipeLeft")
            case .portrait:
                self.swipeLabel.text = "Swipe up to share"
                self.swipeUpIcon.image = #imageLiteral(resourceName: "swipeUp")
            default:
                break
            }
        }
        NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main, using: didRotate)
        
        // Apply shadow on the gridView
        applyShadowOnView(gridView)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    /// Apply a shadow on a UIView.
    func applyShadowOnView(_ view:UIView) {
        
        view.layer.cornerRadius = 6
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 5
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var gridView: GridView!
    
    @IBOutlet weak var logo: UIImageView!
    
    // All the component of the swipeView
    @IBOutlet weak var swipeUpIcon: UIImageView!
    @IBOutlet weak var swipeLabel: UILabel!
    @IBOutlet weak var swipeUpView: UIView!
    
    // All the component of the gridView
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
    
    var gridButtonsArray :[UIButton] = [UIButton]()
    var gridImagesArray :[UIImageView?] = [UIImageView?]()
    
    // All the component of the modelView
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var selected1: UIImageView!
    @IBOutlet weak var selected2: UIImageView!
    @IBOutlet weak var selected3: UIImageView!
    
    
    
    // Use this variable to assign a number to each button of the grid View. I use it for the imagePickerController.
    var buttonNumber = 0
    
    /// Add a picture from the user library
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage ] as? UIImage {
            if buttonNumber == 1 {
                imageTopLeft.image = image
                topLeft.isHidden = true
            } else if buttonNumber == 2 {
                imageTopRight.image = image
                topRight.isHidden = true
            } else if buttonNumber == 3 {
                imageBottomLeft.image = image
                bottomLeft.isHidden = true
            } else if buttonNumber == 4 {
                imageBottomRight.image = image
                bottomRight.isHidden = true
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    /// Request authorization to access the user library and choose a picture.
    @objc func pickImage (number :Int) {
        PHPhotoLibrary.requestAuthorization({status in
            if status == .authorized{
                DispatchQueue.main.async {
                    self.buttonNumber = number
                    self.imagePicker.sourceType = .photoLibrary
                    self.imagePicker.allowsEditing = true
                    self.present(self.imagePicker, animated: true, completion: nil)
                }
            } else {
                self.alertAuthorization()
            }
        })
        
    }
    
    /// Display an alert if the access to the library is not authorized. The user can cancel the operation or go to his settings to authorize the access.
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
    
    /// Access the application settings.
    func accesSettings(){
        if let url = NSURL(string: UIApplication.openSettingsURLString) as URL? {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
    }
    
    /// 4 buttons in the grid view to pick an image in the library
    @IBAction func topLeftButton(_ sender: Any) {
        pickImage(number: 1)
    }
    
    @IBAction func topRightButton(_ sender: Any) {
        pickImage(number: 2)
    }
    
    @IBAction func bottomLeftButton(_ sender: Any) {
        pickImage(number: 3)
    }
    
    @IBAction func bottomRightButton(_ sender: Any) {
        pickImage(number: 4)
    }
    
    
    /// Display the selected image when the model is selected.
    func selected(style: GridView.Style) {
        gridView?.style = style
        selected1.isHidden = style != .model1
        selected2.isHidden = style != .model2
        selected3.isHidden = style != .model3
    }
    
    /// 3 buttons on the bottom for the portrait and on the right for the landscape to chose the grid model.
    @IBAction func ButtonModel1(_ sender: Any) {
        selected(style: .model1)
    }
    
    @IBAction func ButtonModel2(_ sender: Any) {
        selected(style: .model2)
    }
    
    @IBAction func ButtoModel3(_ sender: Any) {
        selected(style: .model3)
    }
    
    /// Animate the grid if it's incomplete
    func animateIncompleteAlert() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, animations: {
            self.gridView.transform = CGAffineTransform(scaleX: 1.04, y: 1.04)
        }) { (success: Bool) in
            if success {
                self.gridView.transform = .identity
            }
        }
        
    }
    
    /// Display an alert if the grid isn't complete.
    func alerteIncompleteGrid(){
        let alert = UIAlertController(title: "Grille incomplète", message: "Pour continuer, veuillez compléter la grille.", preferredStyle: .alert)
        animateIncompleteAlert()
        let action = UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
        })
        alert.addAction(action)
        present(alert, animated: true, completion: {
        })
    }
    
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
       self.sharePicture(isLeft: false)
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
      
            self.sharePicture(isLeft: true)
        
    }
    
    /// Transform the UIView in UIimage (convertView()), then check if the grid is complete, the grid view disappear with an animation and the UIActivityController appear.
    func sharePicture(isLeft: Bool) {
        let image = self.imageToShare.convertView(view: gridView)
        if gridView.checkCompleteGrid() == false {
            alerteIncompleteGrid()
        }else{
        if isLeft {
            UIView.animate(withDuration: 0.3, animations: {
                self.gridView.frame.origin.x = -self.gridView.frame.width
            })
            
        }else{
            UIView.animate(withDuration: 0.3, animations: {
                self.gridView.frame.origin.y = -self.gridView.frame.height
            })
        }
        // Open the sharing menu
        let activityController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        activityController.completionWithItemsHandler = { activity, success, items, error in
            self.gridView.resetGrid()
            UIView.animate(withDuration: 0.3, animations: {
                self.gridView.center.y = self.view.center.y
                self.gridView.center.x = self.view.center.x
            })
        }
        present(activityController, animated: true, completion: nil)
    }
    }
    
    /// 3 buttons to change the background color of the gridView
    
    @IBAction func whiteBackground(_ sender: Any) {
        self.gridView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    @IBAction func blueBackground(_ sender: Any) {
        self.gridView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    }
    
    @IBAction func blackBackground(_ sender: Any) {
        self.gridView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
