//
//  ContentView.swift
//  iOS_UI_Portfolio
//
//  Created by Rick Brown on 23/10/2021.
//
import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      Form {
        Section("Welcome Pages") {
          NavigationLink {
            GlassMorphismWelcomePageUI()
          } label: {
            Text("Glass Morphism Welcome Page UI")
          }
        }
      }
      .navigationTitle("iOS UI Portfolio")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
