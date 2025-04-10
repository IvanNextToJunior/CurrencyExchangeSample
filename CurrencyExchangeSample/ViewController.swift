//
//  ViewController.swift
//  CurrencyExchangeSample
//
//  Created by Ivan2 on 10.04.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var currencySegmentedControl: UISegmentedControl!
    
    @IBOutlet weak private var sumTextField: UITextField!
    
    @IBOutlet weak private var totalSumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencySegmentedControl.setTitle("USD", forSegmentAt: 0)
        currencySegmentedControl.setTitle("EUR", forSegmentAt: 1)
        createToolBar()
    }
    
    
    private func createToolBar() {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //MARK: Change position of UIToolBar: https://www.hackingwithswift.com/forums/swift/toolbar-button-location/5666
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        sumTextField.inputAccessoryView = toolbar
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

