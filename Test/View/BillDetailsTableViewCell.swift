//
//  BillDetailsTableViewCell.swift
//  Project
//
//  Created by vamsi on 07/11/19.
//  Copyright © 2019 vamsi. All rights reserved.
//

import UIKit

class BillDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var billIdKey: UILabel!
    @IBOutlet weak var billIdDateKey: UILabel!
    @IBOutlet weak var billIdTypeKey: UILabel!
    @IBOutlet weak var billTotalKey: UILabel!
    @IBOutlet weak var providerNameKey: UILabel!
    @IBOutlet weak var internetUsageKey: UILabel!

    @IBOutlet weak var billId: UILabel!
    @IBOutlet weak var billIdDate: UILabel!
    @IBOutlet weak var billIdType: UILabel!
    @IBOutlet weak var billTotal: UILabel!
    @IBOutlet weak var providerName: UILabel!
    @IBOutlet weak var internetUsage: UILabel!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(_ bill:Bill){
        billId.text = bill.billId
        billIdDate.text = bill.billDate
        billTotal.text = "\(bill.totalBillAmount ?? 0)"
        switch bill.billType{
        case .Hydro:
            billIdType.text = "Hydro"
        case .Internet:
            billIdType.text = "Internet"
        case .Mobile:
            billIdType.text = "Mobile"
        }
        providerName.text = "peter"
        internetUsage.text = "15GB"
    }

}
