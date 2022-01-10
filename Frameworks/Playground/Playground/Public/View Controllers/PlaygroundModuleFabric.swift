//
//  PlaygroundModuleFabric.swift
//  Playground
//
//  Created by Петр Тартынских  on 10.01.2022.
//

import Foundation

public protocol PlaygroundModuleFabric {
    func getPlaygroundVC() -> PlaygroundViewController
}

public final class MainPlaygroundModuleFabric: PlaygroundModuleFabric {
    
    // MARK: - Init
    
    public init() {}
    
    // MARK: - Public Methods
    
    public func getPlaygroundVC() -> PlaygroundViewController {
        return PlaygroundViewController()
    }
}
