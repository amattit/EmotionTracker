//
//  SwiftUIView.swift
//  
//
//  Created by MikhailSeregin on 16.09.2021.
//

import SwiftUI

final class UpsertEmotionViewModel: ObservableObject {
    private weak var coordinator: EmotionTrackerCoordinatorProtocol?
    
    init(coordinator: EmotionTrackerCoordinatorProtocol?) {
        self.coordinator = coordinator
    }
    
    func dismiss() {
        coordinator?.dismiss()
    }
}

struct UpsertEmotionView: View {
    
    @ObservedObject var viewModel: UpsertEmotionViewModel
    
    var body: some View {
        VStack {
        Text("Hello, there will be view: Upsert Emotion")
            .padding()
            .background(Color.green)
            Button(action: viewModel.dismiss, label: {
                HStack {
                    Spacer()
                    Text("click me! \nto dismiss")
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

struct UpsertEmotionView_Previews: PreviewProvider {
    static var previews: some View {
        UpsertEmotionView(viewModel: UpsertEmotionViewModel(coordinator: nil))
    }
}
