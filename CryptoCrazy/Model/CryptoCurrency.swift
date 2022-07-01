//
//  CryptoCurrency.swift
//  CryptoCrazy
//
//  Created by busraguler on 30.06.2022.
//

import Foundation

struct CryptoCurrency : Decodable {  //dışardan gelen verileri decode eder. //codable ise model yapıyorsak o modelde hem get hem post işlemleri yapılacaksa kullanılır
    let currency : String
    let price : String
}
