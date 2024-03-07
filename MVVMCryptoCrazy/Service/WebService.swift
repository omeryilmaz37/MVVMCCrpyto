//
//  WebService.swift
//  MVVMCryptoCrazy
//
//  Created by Ömer Yılmaz on 6.03.2024.
//

import Foundation

//serverError: Bu durum, sunucudan veri alırken bir hata oluştuğunu belirtir. Örneğin, sunucu yanıt vermiyor veya beklenen veri alınamıyorsa bu hata türü kullanılabilir.
//parsingError: Bu durum, veriyi işlerken bir çözümleme hatası olduğunu belirtir. Örneğin, JSON verisi doğru formatta değilse veya beklenen verileri çözümlemede bir sorun varsa bu hata türü kullanılabilir.
enum CryptoError : Error{
    case serverError
    case parsingError
}

class WebService{
    func downloadCurrencies(url: URL, completion: @escaping (Result<[Crypto], CryptoError>) -> ()) {
        // Kripto para birimi verilerini indirmek için bir işlev tanımlar.
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Belirtilen URL'den veri almak için bir URLSession veri işleme görevi başlatır.
            
            if let _ = error {
                // Eğer bir hata varsa:
                // - .serverError durumunu tamamlar ve çağrıya iletilir.
                completion(.failure(.serverError))
            } else if let data = data {
                // Eğer herhangi bir hata yoksa ve veri alındıysa:
                
                // JSON verilerini çözümlemeye çalışır.
                let cryptoList = try? JSONDecoder().decode([Crypto].self, from: data)
                
                if let cryptoList = cryptoList {
                    // Eğer JSON verileri başarıyla çözümlendi ise:
                    // - Çözümlenen kripto para listesini başarı durumuyla tamamlar ve çağrıya iletilir.
                    completion(.success(cryptoList))
                } else {
                    // Eğer JSON çözümlemesi başarısız olduysa:
                    // - .parsingError durumunu tamamlar ve çağrıya iletilir.
                    completion(.failure(.parsingError))
                }
            }
        }.resume()
    }
}


//CryptoError adında bir enum tanımlıyorsunuz. Bu enum, sunucudan veri alma veya veriyi çözümleme sırasında oluşabilecek hataları belirtmek için kullanılıyor.
//WebService adında bir sınıf tanımlıyorsunuz. Bu sınıf, web hizmeti çağrıları yapmak için kullanılacak fonksiyonları içeriyor.
//downloadCurrencies fonksiyonu, belirtilen bir URL'den kripto para birimi verilerini indirmek için kullanılıyor. Bu fonksiyon, URL'den veri almak için URLSession kullanıyor ve aldığı veriyi JSONDecoder kullanarak çözümlüyor.
//URLSession.shared.dataTask(with:completionHandler:) metodunu kullanarak bir veri indirme işlemi başlatıyorsunuz. Bu metod, bir URL'ye bir HTTP isteği gönderir ve alınan veriyi işlemek için bir kapanış işlevi çağırır.
//Kapanış işlevi, alınan veriyi, yanıtı ve olası hataları işler. Eğer bir hata oluşursa, completion kapanış işlevine .failure durumuyla birlikte ilgili CryptoError durumunu iletiyor. Başarılı bir şekilde veri alındığında ve çözümlendiğinde ise, çözümlenen kripto para listesini completion kapanış işlevine .success durumuyla birlikte iletiyor.
//Bu kod bloğunda, Swift dilinin temel bileşenleri olan enum'lar, sınıflar ve kapanış işlevleri kullanılmıştır. Ayrıca, URL'lerle veri indirme işlemlerini yönetmek için Foundation framework'ünün bir parçası olan URLSession sınıfı kullanılmıştır. JSON verilerini işlemek için ise Foundation framework'ünün bir diğer bileşeni olan JSONDecoder kullanılmıştır.

//------------------------------------------------------------------------------------------------------------------

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

