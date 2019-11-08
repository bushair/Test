//
//  CurrencyExtn.swift
//  sample
//
//  Created by Sandeep Jangra on 2019-10-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
import Foundation
extension Float {
    func currencyFormat() ->String
    {
       // return "$\(self).00"
        return String(format: "$%0.2f", Float(self))
    }
        
        
    
}
