//
//  ExampleDataSource.swift
//  SFBaseKitDemo
//
//  Created by Aleksandar Gyuzelov on 12.07.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import SFBaseKit

protocol ExampleDataSourceProtocol: UITableViewDataSource, UICollectionViewDataSource {
    
    var contentView: ContentViewProtocol? { get set }
    func update(_ data: [Section])
    func removeAll()
    func removeFirstCell(in section: Int)
    
}

class ExampleDataSource: NSObject, ExampleDataSourceProtocol {
    
    var contentView: ContentViewProtocol?
    
    private var dataSource: [Section] = [] {
        didSet {
            contentView?.reloadData()
        }
    }
    
    func update(_ data: [Section]) {
        let reuseIdentifiers: [String] = data.flatMap { $0.cells.map {$0.reuseIdentifier} }
        contentView?.register(cellNames: reuseIdentifiers)
        dataSource.append(contentsOf: data)
    }
    
    func removeAll() {
        dataSource.removeAll()
    }
    
    func removeFirstCell(in section: Int) {
        dataSource[section].cells.removeFirst()
    }
    
}

extension UITableView {
    
    func listen(_ dataSource: ExampleDataSourceProtocol) {
        self.dataSource = dataSource
        dataSource.contentView = self
    }
    
}

extension ExampleDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[safeAt: section]?.cells.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let configurator = dataSource[indexPath.section].cells[indexPath.row]
        return tableView.configureCell(for: configurator, at: indexPath)
    }
    
}

extension UICollectionView {
    
    func listen(_ dataSource: ExampleDataSourceProtocol) {
        self.dataSource = dataSource
        dataSource.contentView = self
    }
    
}

extension ExampleDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[safeAt: section]?.cells.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let configurator = dataSource[indexPath.section].cells[indexPath.item]
        return collectionView.configureCell(for: configurator, at: indexPath)
    }
    
     
}
