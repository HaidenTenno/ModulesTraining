//
//  AppModuleFabric.swift
//  Main
//
//  Created by Петр Тартынских  on 10.01.2022.
//

import Profile
import Playground

final class AppModuleFabric {
    
    private(set) lazy var profileFabric: ProfileModuleFabric =
        MainProfileModuleFabric()
    
    private(set) lazy var playgroudFabric: PlaygroundModuleFabric =
        MainPlaygroundModuleFabric()
}
