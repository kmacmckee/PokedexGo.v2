//
//  UIView+Shadow.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 7/31/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.6
        layer.shadowRadius = 8
        clipsToBounds = false
    }
    
}
