//
//  PlaygroundViewController.swift
//  Playground
//
//  Created by Петр Тартынских  on 10.01.2022.
//

import StylesResources
import UIKit

public final class PlaygroundViewController: UIViewController {
    
    // MARK: - Init
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        setupTabBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIViewController
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupTabBar() {
        tabBarItem = UITabBarItem(title: "Игра",
                                  image: Assets.controller,
                                  selectedImage: UIImage(systemName: "gamecontroller"))
    }
    
    private func setupUI() {
        view.backgroundColor = .systemCyan
    }
}
