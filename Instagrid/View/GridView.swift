//
//  GridView.swift
//  Instagrid
//
//  Created by samahir adi on 09/04/2019.
//  Copyright © 2019 Syadesign. All rights reserved.
//

import UIKit

class GridView: UIView {
    @IBOutlet var gridStackView :UIStackView?
    @IBOutlet var topStackView :UIStackView?
    @IBOutlet var bottomStackView :UIStackView?
    
    @IBOutlet var viewTopLeft :UIView?
    @IBOutlet var viewTopRight :UIView?
    @IBOutlet var viewBottomLeft :UIView?
    @IBOutlet var viewBottomRight :UIView?
    
    @IBOutlet var gallery : [UIImageView]!
    @IBOutlet var buttons : [UIButton]!
    
    // enum for the 3 grid models
    enum Style {
        case model1, model2, model3
    }
    
    
    var style :Style = .model1 {
        didSet {
            setStyle(style)
            for i in gallery {
                    i.contentMode = .scaleAspectFill
                    i.clipsToBounds = true
            }
        }
    }
    
    /// Create variables to set the model style and hide the corresponding view
    func model(topLeft: Bool, topRight: Bool, bottomLeft: Bool, bottomRight: Bool ) {
        viewTopLeft?.isHidden = topLeft
        viewTopRight?.isHidden = topRight
        viewBottomLeft?.isHidden = bottomLeft
        viewBottomRight?.isHidden = bottomRight
    }
    
    /// Create the 3 grid models by hiding the corresponding view from the stackView
    func setStyle(_ style: Style) {
        switch style {
        case .model1:
           model(topLeft: true, topRight: false, bottomLeft: false, bottomRight: false)
        case .model2:
            model(topLeft: false, topRight: false, bottomLeft: true, bottomRight: false)
        case .model3:
            model(topLeft: false, topRight: false, bottomLeft: false, bottomRight: false)
        }
    }
    
    /// Check if the grid is complete before sharing
    func checkCompleteGrid() -> Bool{
        switch style {
        case .model1:
            if gallery[1].image == nil ||  gallery[2].image == nil ||  gallery[3].image == nil {
                return false
            }
        case .model2:
            if gallery[0].image == nil ||  gallery[1].image == nil ||   gallery[3].image == nil {
                return false
            }
        case .model3:
            if gallery[0].image == nil ||  gallery[1].image == nil ||  gallery[2].image == nil ||  gallery[3].image == nil {
                return false
            }
        }
        return true
    }
    
    /// Reset the initial grid after the share
    func resetGrid() {
        for img in gallery {
            img.image = nil
        }
        for i in buttons {
            i.isHidden = false
        }
        backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    }
}

