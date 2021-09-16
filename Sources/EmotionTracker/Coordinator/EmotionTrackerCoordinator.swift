import Routing
import UIKit
import SwiftUI

protocol EmotionTrackerCoordinatorProtocol: Coordinator {
    func showTrackerView()
    func showUpsertEmotion()
}

internal final class EmotionTrackerCoordinator: EmotionTrackerCoordinatorProtocol {
    public var finishDelegate: CoordinatorFinishDelegate?
    
    public var navigationController: UINavigationController
    
    public var childCoordinators: [Coordinator] = []
    
    public var type = "EmotionTracker"
    
    internal var viewFactory: ViewFactory!
    
    public func start() {
        showTrackerView()
    }
    
    public init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showTrackerView() {
        assert(viewFactory != nil, "setupViewController in Factory")
        let view = viewFactory.createTrackerView()
        navigationController.pushViewController(view, animated: true)
    }
    
    func showUpsertEmotion() {
        assert(viewFactory != nil, "setupViewController in Factory")
        let view = viewFactory.createUpsertView()
        navigationController.present(view, animated: true, completion: nil)
    }
    
}
