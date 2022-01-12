//
//  ProfileViewController.swift
//  Profile
//
//  Created by Петр Тартынских  on 10.01.2022.
//

import Alamofire
import StylesResources
import UIKit

public final class ProfileViewController: UIViewController {
    
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
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let request = AF.request("https://swapi.dev/api/films")
        request.responseJSON { (data) in
            print(data)
        }
    }
    
    // MARK: - Private Methods
    
    private func setupTabBar() {
        tabBarItem = UITabBarItem(title: "Профиль",
                                  image: Assets.person,
                                  selectedImage: Assets.person)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemMint
    }
}
