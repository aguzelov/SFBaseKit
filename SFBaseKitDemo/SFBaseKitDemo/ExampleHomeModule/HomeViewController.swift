//
//  HomeViewController.swift
//  SFBaseKitDemo
//
//  Created by Aleksandar Geyman on 21.04.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import SFBaseKit

protocol ViewModelProtocol: class {
    var tableDataSource: ExampleDataSourceProtocol { get }
    var collectionDataSource: ExampleDataSourceProtocol { get }
    func start()
}

protocol HomeSceneDelegate: Coordinator {
    func homeSceneShouldContinueToLogOut()
}

class HomeViewController: UIViewController {
    
    unowned var sceneDelegate: HomeSceneDelegate!
    private var viewModel: ViewModelProtocol!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel()
        tableView.listen(viewModel.tableDataSource)
        collectionView.listen(viewModel.collectionDataSource)
        viewModel.start()
    }
    
    @IBAction func DidTapOnLogOutButton(_ sender: Any) {
        sceneDelegate.homeSceneShouldContinueToLogOut()
    }
}

// MARK: - StoryboardInstantiatable
extension HomeViewController: StoryboardInstantiatable {
    static var storyboardName: String {
        return "HomeScreen"
    }
}

