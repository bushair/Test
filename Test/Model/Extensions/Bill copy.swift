//
//  Bill.swift
//  sample
//
//  Created by MacStudent on 2019-10-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
class Bill : IDisplay
{
    func iDisplay() {
        
    }
    
    
    
    var billId : String
    var billDate :  String
    enum Types {
        case Internet
        case Hydro
        case Mobile
    }
    var billType : Types
    var totalBillAmount : Float!
    
    init(billId : String , billDate : String, billType : Types) {
        self.billId = billId
        self.billDate = billDate
        self.billType = billType
    }
    
   

}
