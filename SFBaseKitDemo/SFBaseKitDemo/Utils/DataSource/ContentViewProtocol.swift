//
//  ContentViewProtocol.swift
//  SFBaseKitDemo
//
//  Created by Aleksandar Gyuzelov on 13.07.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import SFBaseKit

protocol ContentViewProtocol {
    
    func reloadData()
    func register(cellNames: [String])
    
}

extension UITableView: ContentViewProtocol {}

extension UICollectionView: ContentViewProtocol {}
