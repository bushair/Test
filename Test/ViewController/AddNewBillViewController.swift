//
//  AddNewBillViewController.swift
//  Project
//
//  Created by vamsi on 06/11/19.
//  Copyright © 2019 vamsi. All rights reserved.
//

import UIKit

protocol AddNewBillViewControllerDelegate:NSObject {
    func didSelectSaveBtn(_ bill:Bill)
}



class AddNewBillViewController: UIViewController {
    
    @IBOutlet weak var enterBillIDTextField: UITextField!
    @IBOutlet weak var enterAmountTextField: UITextField!
    @IBOutlet weak var enterBillDateTextField: UITextField!
    @IBOutlet weak var enterBillTypeTextField: UITextField!
    var pickerView = UIPickerView()
    var datePicker = UIDatePicker()
    let toolBar = UIToolbar()
    let billTypesArray = ["Hydro","Internet","Mobile"]
  weak var delegate:AddNewBillViewControllerDelegate?
    var billCopyObj:Bill?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupToolBar()
        setupPicker()
        setupTextFields()
    }
    
    func setupPicker(){
        pickerView.delegate = self
        enterBillTypeTextField.inputView = pickerView
        enterBillTypeTextField.inputAccessoryView = toolBar
    }
    
    func setupToolBar(){
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneBtnAction))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let cancelButton =   UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelBtnAction))
        toolBar.setItems([cancelButton, space,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
    }
    
    @objc func datePickerValueChanged(_ date:UIDatePicker){
        enterBillDateTextField.text = datePicker.date.dateformatter()
    }
    
    func setupTextFields(){
        enterBillDateTextField.inputAccessoryView = toolBar
        enterBillDateTextField.inputView = datePicker
    }
    
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        let date = enterBillDateTextField.text ?? ""
        let id = enterBillIDTextField.text ?? ""
        let amount = Float(enterAmountTextField.text ?? "")
        var types = Bill.Types.self
        switch enterBillTypeTextField.text ?? "" {
        case billTypesArray[0]:
            billCopyObj?.billType = .Hydro
        case billTypesArray[1]:
            billCopyObj?.billType = .Internet
        case billTypesArray[2]:
            billCopyObj?.billType = .Mobile
        default:
            break
        }
        
      let billObj =  Bill(billId: id, billDate: date, billType: .Hydro)
        delegate?.didSelectSaveBtn(billObj)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func doneBtnAction(){
        view.endEditing(true)
    }
    
    
    @objc func cancelBtnAction(){
        view.endEditing(true)
    }
    
}

extension AddNewBillViewController:UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return billTypesArray.count
    }
}

extension AddNewBillViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return billTypesArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        enterBillTypeTextField.text = billTypesArray[row]
    }
}
