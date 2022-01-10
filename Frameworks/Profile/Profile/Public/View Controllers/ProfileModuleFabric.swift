//
//  ProfileModuleFabric.swift
//  Profile
//
//  Created by Петр Тартынских  on 10.01.2022.
//

import Foundation

public protocol ProfileModuleFabric {
    func getProfileVC() -> ProfileViewController
}

public final class MainProfileModuleFabric: ProfileModuleFabric {
    
    // MARK: - Init
    
    public init() {}
    
    // MARK: - Public Methods
    
    public func getProfileVC() -> ProfileViewController{
        return ProfileViewController()
    }
}
