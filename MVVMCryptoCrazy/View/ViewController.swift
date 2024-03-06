//
//  ViewController.swift
//  MVVMCryptoCrazy
//
//  Created by Ömer Yılmaz on 5.03.2024.
//

import UIKit
// .... sadasd
class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    // m
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = "Crypto Currency"
        content.secondaryText = "Crypto Price"
        cell.contentConfiguration = content
        return cell//fff
    }
}

