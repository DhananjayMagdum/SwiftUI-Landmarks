//
//  ContentView.swift
//  Landmarks
//
//  Created by Dhananjay Magdum on 23/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            LandmarkList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModeleData())
    }
}
