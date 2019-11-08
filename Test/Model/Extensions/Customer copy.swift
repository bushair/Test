//
//  Customer.swift
//  sample
//
//  Created by MacStudent on 2019-10-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
class Customer : IDisplay
{
    
    
    var customerId : String
    var firstName : String
    var lastName : String!
    var fullName : String
    var email : String
    //var bill : Bill
    var billDictionary = Dictionary<String,Bill>()
    
    init(customerId : String, firstName : String, lastName : String, email : String ,billDictionary : Dictionary<String,Bill>)
    {
        self.customerId = customerId
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
       self.billDictionary = billDictionary
        self.fullName = firstName + lastName
        //self.bill = bill
        
        //self.billDictionary.updateValue(bill, forKey: bill.billId)
        
    }
    func iDisplay() {
        print("**************************************************************")
        print("Customer Id : \(customerId)")
        print("Full Name : \(fullName)")
        for i in billDictionary.values
        {
            i.iDisplay()
        }
        
    }
}
