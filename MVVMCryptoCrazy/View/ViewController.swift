//
//  ViewController.swift
//  MVVMCryptoCrazy
//
//  Created by Ömer Yılmaz on 5.03.2024.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var cryptoList = [Crypto]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")
        WebService().downloadCurrencies(url: url!) { result in
            // Belirtilen URL'den kripto para birimi verilerini indirmek için WebService sınıfının downloadCurrencies fonksiyonunu çağırır.
            // - url: İndirilecek verinin adresini belirtir.
            // - result: İşlem sonucunu temsil eden bir Result türü alır. Başarılı veya başarısız duruma göre işlem yapar.
            
            switch result {
                case .success(let cryptos):
                    // İşlem başarıyla tamamlandığında:
                    // - Çözümlenen kripto para listesini alır ve self.cryptoList'e atar.
                    // - TableView'ı güncelleyerek yeni verileri ekrana yansıtır.
                    self.cryptoList = cryptos
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    // İşlem başarısız olduğunda:
                    // - Oluşan hatayı ekrana yazdırır.
                    print(error)
            }
        }
        
//        Bir URL oluşturulur: Bu URL, kripto para birimi verilerinin bulunduğu kaynağa yönlendirilir.
//
//        WebService sınıfının downloadCurrencies fonksiyonu çağrılır: Bu fonksiyon, belirtilen URL'den kripto para birimi verilerini indirmek için kullanılır. İndirme işlemi asenkron olarak gerçekleştirilir ve sonuç, bir Result türü içinde döndürülür.
//        Result türü üzerinde bir anahtar kelimeler kullanılarak bir switch ifadesi oluşturulur: Bu ifade, indirme işleminin başarılı olup olmadığını kontrol eder.
        
//        İndirme işlemi başarılı olduğunda:
//        Çözümlenen kripto para listesi cryptos adlı bir değişkene atanır.
//        Bu kripto para listesi self.cryptoList özelliğine atanarak kullanılabilir hale getirilir.
//        TableView güncellenir ve yeni veriler ekrana yansıtılır.
//        İndirme işlemi başarısız olduğunda:
//        Oluşan hata konsola yazdırılır.
//        Bu kod bloğunda, Swift dilinin temel bileşenleri olan URL oluşturma, asenkron işlemler, Result türü, switch ifadeleri ve DispatchQueue gibi yapılar kullanılmıştır. Ayrıca, WebService sınıfı aracılığıyla veri indirme işlemi gerçekleştirilmiş ve sonuçları ele alınmıştır.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = cryptoList[indexPath.row].currency
        content.secondaryText = cryptoList[indexPath.row].price
        cell.contentConfiguration = content
        return cell
    }
}

