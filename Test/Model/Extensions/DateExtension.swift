//
//  DateExtension.swift
//  sample
//
//  Created by Sandeep Jangra on 2019-10-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
extension Date
{
    
    func dateformatter() -> String {
        let dateFormatterPrint=DateFormatter()
        dateFormatterPrint.dateFormat="dd MMM yyyy"
        let formattedDate = dateFormatterPrint.string(from: self)
        return formattedDate
        
    }
    

}
