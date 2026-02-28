//
//  ExchangeRate.swift
//  CurrencyExchangeSample
//
//  Created by Ivan2 on 13.04.2025.
//

import Foundation

class ExchangeRate {
  
   

 func decodeJSONObject(from data: Data) -> Rate? {
        do {
            let object = try JSONDecoder().decode(Rate.self, from: data)
            return object
        }
        catch {
            print(error)
        }
        return nil
    }

}
