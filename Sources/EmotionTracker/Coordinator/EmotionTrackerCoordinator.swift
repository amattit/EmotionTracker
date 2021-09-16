import Routing
import UIKit
import SwiftUI

public protocol EmotionTrackerCoordinatorProtocol: Coordinator {
    func showTrackerView()
    func showUpsertEmotion()
}

public final class EmotionTrackerCoordinator: EmotionTrackerCoordinatorProtocol {
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type = "EmotionTracker"
    
    func start() {
        showTrackerView()
    }
    
    init(_ navigationController: UINavigationController) {
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
