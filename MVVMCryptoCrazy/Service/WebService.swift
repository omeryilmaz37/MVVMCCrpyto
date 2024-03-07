//
//  WebService.swift
//  MVVMCryptoCrazy
//
//  Created by Ömer Yılmaz on 6.03.2024.
//

import Foundation

class WebService{
    func downloadCurrencies() {
        // URLSession.shared: Paylaşılan bir URLSession örneğine erişir.
        // URLSession sınıfı, ağ üzerinde veri alışverişi yapmak için kullanılan bir API'dir.

        // dataTask(with:completionHandler:) metodu, belirtilen URL'ye bir istek göndermek için kullanılır.
        // İlk parametre olan "with", URL isteği oluşturmak için kullanılır. URLRequest türünde bir parametre alır.
        // URLRequest, belirli bir URL'ye ve belirli bir HTTP metoduna göre bir ağ isteği oluşturmak için kullanılır.

        // completionHandler, isteğin tamamlanmasıyla ilgili bilgileri ve herhangi bir alınan veriyi işlemek için kullanılır.
        // Bu kapatma işlevi, üç parametre alır: alınan veri (Data), URL yanıtı (URLResponse) ve olası hata (Error).
        // Alınan veri, istekten dönen veriyi temsil eder.
        // URLResponse, isteğin yanıtını temsil eder ve HTTP yanıt başlıkları, durum kodu vb. içerebilir.
        // Error, olası bir hata durumunda bu parametre hata bilgisini içerir.

        URLSession.shared.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
    }
}
