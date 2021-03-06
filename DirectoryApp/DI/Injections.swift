//
//  Injections.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    public static func setup() {
        ContentListInjections.setup(container: defaultContainer)
        ContentInjections.setup(container: defaultContainer)
        Container.loggingFunction = nil
    }
}
