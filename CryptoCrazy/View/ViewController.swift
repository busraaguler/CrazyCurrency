//
//  ViewController.swift
//  CryptoCrazy
//
//  Created by busraguler on 30.06.2022.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    
    var colorArray = [UIColor]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableview.delegate = self
        tableview.dataSource = self
        self.colorArray = [
            UIColor(red: 100/255, green: 187/255, blue: 234/255, alpha: 0.1),
            UIColor(red: 96/255, green: 157/255, blue: 189/255, alpha: 0.1),
            UIColor(red: 56/255, green: 154/255, blue: 198/255, alpha: 0.1),
            UIColor(red: 70/255, green: 78/255, blue: 164/255, alpha: 0.1),
            UIColor(red: 134/255, green: 54/255, blue: 123/255, alpha: 0.1),
            UIColor(red: 55/255, green: 32/255, blue: 87/255, alpha: 0.1)
            
        ]
        getData()

    }
    
    func getData(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        Webservice().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos{
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos) //cryptplistviewmodel burada initialize ediliyor
                
                DispatchQueue.main.async { //internetten indireceğimiz için asenkron bir şekilde olmalı
                    self.tableview.reloadData()
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsSection() //boşsa sıfır, değilse numberofRowsSection fonksiyonu çağırılır
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CyrptoTableViewCell
        
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        cell.backgroundColor = colorArray[indexPath.row % 6]
        return cell
    }


}

