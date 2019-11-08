//
//  ATButton.swift
//  Project
//
//  Created by vamsi on 06/11/19.
//  Copyright © 2019 vamsi. All rights reserved.
//

import UIKit

@IBDesignable class ATButton: UIButton {

    @IBInspectable var borderClr:UIColor = .black{
        didSet{
            self.layer.borderColor = borderClr.cgColor
        }
    }
    
    @IBInspectable var border_Width:CGFloat = 1{
        didSet{
            self.layer.borderWidth = border_Width
        }
    }

}
