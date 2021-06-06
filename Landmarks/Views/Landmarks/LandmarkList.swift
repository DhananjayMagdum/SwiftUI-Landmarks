//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Dhananjay Magdum on 30/05/21.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData : ModeleData
    @State private var showFavouritesOnly = false
    private var favourteLandMarks: [Landmark] { modelData.landmarks.filter { !showFavouritesOnly || $0.isFavorite } }
    var body: some View {
        NavigationView {
            List {
                Toggle("Show Favorites", isOn: $showFavouritesOnly)
                ForEach(favourteLandMarks) {
                    landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
               
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModeleData())
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))

    }
}
