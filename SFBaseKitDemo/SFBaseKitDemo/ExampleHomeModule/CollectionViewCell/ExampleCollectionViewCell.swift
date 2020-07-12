//
//  ExampleCollectionViewCell.swift
//  SFBaseKitDemo
//
//  Created by Aleksandar Gyuzelov on 12.07.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import SFBaseKit

class ExampleCollectionViewCell: UICollectionViewCell, Configurable {

    // MARK: - Outlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Configurable
    
    func configureWith(_ data: String) {
        titleLabel.text = data
    }
}
