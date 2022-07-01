//
//  CryptoViewModel.swift
//  CryptoCrazy
//
//  Created by busraguler on 1.07.2022.
//

import Foundation
//VİEWMODEL!İ YAZMA AMACIMIZ VİEW CONTROLLER'DA YAZDIKLARIMIZI KULLANMAK.
struct CryptoListViewModel {
    let cryptoCurrencyList : [CryptoCurrency] //cryptoCurrency'i liste halinde tutmaktadır.
    
    func numberOfRowsSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index :Int) -> CryptoViewModel { //CryptoViewModel döndürür.
        let crypto = cryptoCurrencyList[index]  //listedeki  indexleri alır
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}

struct CryptoViewModel {
    let cryptoCurrency : CryptoCurrency
    
    /*var name : String {
       return self.cryptoCurrency.currency
    }
    var price : String {
        return self.cryptoCurrency.price
    }*/
}

extension CryptoViewModel {   //extension: önceden oluşturulan bi yapıya eklenti yapılmasını sağlar. neden kullanılır? çünkü viewmodel'i oldukça yalın yazmak hedeflenmiştir.Test edilme anında rahatlık sağlar.
    
    var name : String {
       return self.cryptoCurrency.currency
    }
    var price : String {
        return self.cryptoCurrency.price
    }
}
