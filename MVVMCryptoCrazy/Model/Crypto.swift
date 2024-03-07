//
//  Crypto.swift
//  MVVMCryptoCrazy
//
//  Created by Ömer Yılmaz on 5.03.2024.
//

import Foundation

struct Crypto: Decodable {
    // Bu yapı, JSON formatındaki verileri çözebilir yani içeri aktarır verileri.
    // currency: Kripto para biriminin adını içerir.
    // price: Kripto para biriminin fiyatını içerir.
    let currency: String
    let price: String
}
