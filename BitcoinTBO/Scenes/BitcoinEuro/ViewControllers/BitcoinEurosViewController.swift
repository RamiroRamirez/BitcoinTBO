//
//  BitcoinEurosViewController.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 18.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import UIKit

class BitcoinEurosViewController            : UIViewController {

    // MARK: - Outlets
    
    @IBOutlet private weak var tableView    : BitcoinEuroTableView!
    
    // MARK: - Properties
    
    var bitcoinEuroDataSource               = BitcoinEuroDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
