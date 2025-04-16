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
            let object = try JSONDecoder().decode(JSONObject.self, from: data)
            return object.rates
        }
        catch {
            print(error)
        }
        return nil
    }

}
