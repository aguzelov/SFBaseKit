//
//  HomeViewModel.swift
//  SFBaseKitDemo
//
//  Created by Aleksandar Gyuzelov on 12.07.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import SFBaseKit

class HomeViewModel: ViewModelProtocol {
    
    typealias TableViewCellConfigurator = BaseViewConfigurator<ExampleTableViewCell>
    typealias CollectionViewCellConfigurator = BaseViewConfigurator<ExampleCollectionViewCell>
    
    var tableDataSource: ExampleDataSourceProtocol
    var collectionDataSource: ExampleDataSourceProtocol
    
    init() {
        tableDataSource = ExampleDataSource()
        collectionDataSource = ExampleDataSource()
    }
    
    func start() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            var cells: [TableViewCellConfigurator] = []
            for _ in 3...20 {
                cells.append(TableViewCellConfigurator(data: "🐣"))
            }
            let section = Section(headerView: nil, cells: cells)
            self?.tableDataSource.update([section])
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) { [weak self] in
            self?.tableDataSource.removeAll()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            var cells: [CollectionViewCellConfigurator] = []
            for _ in 3...20 {
                cells.append(CollectionViewCellConfigurator(data: "🐶"))
            }
            let section = Section(headerView: nil, cells: cells)
            self?.collectionDataSource.update([section])
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            for _ in 1...4 {
                self?.collectionDataSource.removeFirstCell(in: 0)
            }
        }
    }
}
