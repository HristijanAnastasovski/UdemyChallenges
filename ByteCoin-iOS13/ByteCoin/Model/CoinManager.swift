//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didReceiveResponse(coinObj: CoinDTO)
    func responseError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "1AA63FF8-4F3C-4384-B1F8-2621B5A0CD25"
    
    var delegate: CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String){
        let session = URLSession(configuration: .default)
        let apiURL = URL(string: "\(baseURL)/\(currency)?apikey=\(apiKey)")!
        let task = session.dataTask(with: apiURL) { (data, response, error) in
            if error != nil {
                self.delegate?.responseError(error: error!)
            }
            if let responseData = data {
                let coinDTO = self.parseJSON(data: responseData)
                if coinDTO != nil {
                    self.delegate?.didReceiveResponse(coinObj: coinDTO!)
                }
            }
            
        }
        task.resume()
    }

    func parseJSON(data: Data) -> CoinDTO? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CoinDTO.self, from: data)
            return decodedData
        } catch {
            self.delegate?.responseError(error: error)
            return nil
        }
        
    }
    
}
