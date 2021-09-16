//
//  SwiftUIView.swift
//  
//
//  Created by MikhailSeregin on 16.09.2021.
//

import SwiftUI

final class EmotionTrackerViewModel: ObservableObject {
    private weak var coordinator: EmotionTrackerCoordinatorProtocol?
    
    init(coordinator: EmotionTrackerCoordinatorProtocol?) {
        self.coordinator = coordinator
    }
    
    func presentUpserView() {
        coordinator?.showUpsertEmotion()
    }
}

struct EmotionTrackerView<ViewModel>: View where ViewModel: EmotionTrackerViewModel {
    
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack {
            Text("Hello, there will be view: Tracker")
                .padding()
                .background(Color.red)
            Button(action: viewModel.presentUpserView, label: {
                HStack {
                    Spacer()
                    Text("click me! \nShowUpserView")
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding()
                .background(Color.yellow)
                .cornerRadius(15)
            })
            .accentColor(.green)
            .padding()
        }
    }
}

struct EmotionTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionTrackerView(viewModel: EmotionTrackerViewModel(coordinator: nil))
    }
}
