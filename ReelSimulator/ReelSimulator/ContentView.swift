//
//  ContentView.swift
//  ReelSimulator
//
//  Main content view that combines camera and overlay
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Camera feed layer
            CameraView()
                .edgesIgnoringSafeArea(.all)
            
            // Instagram Reel UI overlay layer
            ReelOverlayView()
                .edgesIgnoringSafeArea(.all)
        }
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
