//
//  CustomerListTableViewController.swift
//  Project
//
//  Created by vamsi on 06/11/19.
//  Copyright © 2019 vamsi. All rights reserved.
//

import UIKit

class CustomerListTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var customersArray = ["Peter","John","Ryan","Parker"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        tableView.tableFooterView = .init()
    }
    
    @IBAction func logoutBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let des = segue.destination as? AddNewCustomerViewController{
            des.delegate = self
        }
    }
    
}

extension CustomerListTableViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") else{return .init()}
        cell.textLabel?.text = customersArray[indexPath.row]
        return cell
    }
}

extension CustomerListTableViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let billDetailsVC = self.storyboard?.instantiateViewController(identifier: "ShowBillDetailsViewController") as? ShowBillDetailsViewController{
            self.navigationController?.pushViewController(billDetailsVC, animated: true)
        }
    }
}

extension CustomerListTableViewController:AddNewCustomerViewControllerDelegate{
    func didSelectSaveBtn(_ name: String) {
        self.customersArray.append(name)
        self.tableView.reloadData()
    }
}
