//
//  ModelView.swift
//  Instagrid
//
//  Created by samahir adi on 03/04/2019.
//  Copyright © 2019 Syadesign. All rights reserved.
//

import UIKit

class ModelView: UIView {
    
    @IBOutlet var model1 :ModelView?
    @IBOutlet var model2 :ModelView?
    @IBOutlet var model3 :ModelView?
    @IBOutlet var selected1 :UIImageView?
    @IBOutlet var selected2 :UIImageView?
    @IBOutlet var selected3 :UIImageView?
    
   
    
    
    enum Model  {
        case model1, model2, model3
    }
    
    var model: Model = .model2 {
        didSet {
            setModel (model)
        }
    }

    func setModel (_ model: Model) {
        switch model {
        case .model1:
            model1?.isHidden = false
            model2?.isHidden = true
            model3?.isHidden = true
            selected1?.isHidden = false
            selected2?.isHidden = true
            selected3?.isHidden = true
        case .model2:
            model1?.isHidden = true
            model2?.isHidden = false
            model3?.isHidden = true
            selected1?.isHidden = true
            selected2?.isHidden = false
            selected3?.isHidden = true
        case .model3:
            model1?.isHidden = true
            model2?.isHidden = true
            model3?.isHidden = false
            selected1?.isHidden = true
            selected2?.isHidden = true
            selected3?.isHidden = false
        }
        }
    }

