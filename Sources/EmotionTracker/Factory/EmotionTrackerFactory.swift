//
//  File.swift
//  
//
//  Created by MikhailSeregin on 16.09.2021.
//

import Foundation
import Routing
import UIKit

public final class EmotionTrackerFactory {
    static func create(with navigationController: UINavigationController) -> Coordinator {
        let coordinator = EmotionTrackerCoordinator(navigationController)
        let viewFactory = ViewFactory(coordinator: coordinator)
        coordinator.viewFactory = viewFactory
        return coordinator
    }
}
