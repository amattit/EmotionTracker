//
//  File.swift
//  
//
//  Created by MikhailSeregin on 16.09.2021.
//

import Foundation
import SwiftUI

protocol ViewFactoryProtocol {
    func createTrackerView() -> UIViewController
    func createUpsertView() -> UIViewController
}

final class ViewFactory: ViewFactoryProtocol {
    let coordinator: EmotionTrackerCoordinatorProtocol
    
    init(coordinator: EmotionTrackerCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func createTrackerView() -> UIViewController {
        let viewModel = EmotionTrackerViewModel(coordinator: coordinator)
        return EmotionTrackerView(viewModel: viewModel)
            .toHostingController()
    }
    
    func createUpsertView() -> UIViewController {
        let viewModel = UpsertEmotionViewModel(coordinator: coordinator)
        return UpsertEmotionView(viewModel: viewModel).toHostingController()
    }
}

extension View {
    func toHostingController() -> UIViewController {
        UIHostingController(rootView: self)
    }
}
