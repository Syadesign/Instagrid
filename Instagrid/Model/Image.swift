//
//  Image.swift
//  Instagrid
//
//  Created by samahir adi on 14/05/2019.
//  Copyright © 2019 Syadesign. All rights reserved.
//

import Foundation
import Photos

struct Image {
    
    func convertView(view: GridView) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let imgConverted = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imgConverted
        
    }
    
    func notif() {
        let name = Notification.Name(rawValue : "imageConverted")
        let notification = Notification(name: name)
        NotificationCenter.default.post(notification)
    }
}

