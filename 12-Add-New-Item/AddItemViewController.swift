//
//  AddItemViewController.swift
//  12-Add-New-Item
//
//  Created by vmalikov on 8/11/16.
//  Copyright © 2016 justForFun. All rights reserved.
//

import UIKit

protocol DataEnteredDelegate: class {
    func userDidAddNewItem(newItem: String)
}

class AddItemViewController: UIViewController, UITextFieldDelegate {

    weak var delegate: DataEnteredDelegate? = nil

    @IBOutlet weak var newItemName: UITextField!

    override func viewDidLoad() {
        newItemName.becomeFirstResponder()
        newItemName.delegate = self
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        newItemName.resignFirstResponder()

        guard let text = newItemName.text else {
            self.navigationController?.popViewControllerAnimated(true)
            return false
        }

        delegate?.userDidAddNewItem(text)
        self.navigationController?.popViewControllerAnimated(true)
        
        return true
    }
}
