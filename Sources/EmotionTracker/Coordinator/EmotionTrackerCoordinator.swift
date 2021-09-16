import Routing
import UIKit
import SwiftUI

protocol EmotionTrackerCoordinatorProtocol: Coordinator {
    func showTrackerView()
    func showUpsertEmotion()
}

public final class EmotionTrackerCoordinator: EmotionTrackerCoordinatorProtocol {
    public var finishDelegate: CoordinatorFinishDelegate?
    
    public var navigationController: UINavigationController
    
    public var childCoordinators: [Coordinator] = []
    
    public var type = "EmotionTracker"
    
    public func start() {
        showTrackerView()
    }
    
    public init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showTrackerView() {
        let view = UIHostingController(rootView: EmotionTrackerView(viewModel: EmotionTrackerViewModel(coordinator: self)))
        navigationController.pushViewController(view, animated: true)
    }
    
    func showUpsertEmotion() {
        let view = UIHostingController(rootView: UpsertEmotionView(viewModel: UpsertEmotionViewModel(coordinator: self)))
        navigationController.present(view, animated: true, completion: nil)
    }
    
}
