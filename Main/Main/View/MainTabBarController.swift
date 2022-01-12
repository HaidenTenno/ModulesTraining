//
//  MainTabBarController.swift
//  Main
//
//  Created by Петр Тартынских  on 10.01.2022.
//

import Playground
import Profile
import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Private Properties
    
    private let playgroundFabric: PlaygroundModuleFabric
    private let profileFabric: ProfileModuleFabric
    
    private lazy var playground = playgroundFabric.getPlaygroundVC()
    private lazy var profile = profileFabric.getProfileVC()
    
    // MARK: - Init
    
    init(playgroundFabric: PlaygroundModuleFabric,
         profileFabric: ProfileModuleFabric) {
        self.playgroundFabric = playgroundFabric
        self.profileFabric = profileFabric
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupControllers()
    }
    
    // MARK: - Private Methods
    
    private func setupTabBar() {
        tabBar.tintColor = .systemYellow
        tabBar.barTintColor = .systemIndigo
        tabBar.unselectedItemTintColor = .systemGray5
        
//        if #available(iOS 15.0, *) {
//            let appearance = UITabBarAppearance()
//            appearance.configureWithOpaqueBackground()
//            appearance.backgroundColor = .systemIndigo
//            
//            tabBar.standardAppearance = appearance
//            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
//        }
    }
    
    private func setupControllers() {
        setViewControllers([playground, profile], animated: false)
    }
}

