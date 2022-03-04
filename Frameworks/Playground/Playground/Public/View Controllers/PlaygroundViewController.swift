//
//  PlaygroundViewController.swift
//  Playground
//
//  Created by Петр Тартынских  on 10.01.2022.
//

import StylesResources
import UIComponents
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
                                  selectedImage: Assets.controller)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemRed
        
        let likeView = LikeView(size: 50)
        view.addSubview(likeView)

        NSLayoutConstraint.activate([
            likeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            likeView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
