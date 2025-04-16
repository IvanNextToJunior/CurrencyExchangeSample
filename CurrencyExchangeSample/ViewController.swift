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
    
    private let exchangeRate = ExchangeRate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencySegmentedControl.setTitle("USD", forSegmentAt: 0)
        currencySegmentedControl.setTitle("EUR", forSegmentAt: 1)
        createToolBar()
        getCurrency(fromObject: {_ in})
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
    
  private func getCurrency(fromObject: @escaping (Rate) -> Void) {
      
        let urlString = "https://api.vatcomply.com/rates"
       
        guard let url = URL(string: urlString) else {return}
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            
            guard let data = data,
                  let rate = self.exchangeRate.decodeJSONObject(from: data)
            
            else {
                return
            }
           
            self.totalSumLabel.text = "Total sum: \(String(Int(self.sumTextField.text!)! * rate.usd))"
            

        }
        task.resume()
    }
}

