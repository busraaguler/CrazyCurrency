//
//  WebService.swift
//  CryptoCrazy
//
//  Created by busraguler on 30.06.2022.
//

import Foundation

class Webservice {
    
    
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> ()){ //fonksiyon tamamlandıktan sonra çağrılır, sonunda bişey döndürülür
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else{
                if let data = data {
                   let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from:data)
                    print(cryptoList)
                    if let cryptoList = cryptoList{
                        completion(cryptoList)
                    }
                }
            }
        }.resume() //işlemin başlamasını sağlar.
    }
}
