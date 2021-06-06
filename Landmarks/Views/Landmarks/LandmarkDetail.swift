//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Dhananjay Magdum on 30/05/21.
//

import SwiftUI
import Combine
struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModeleData
    var landmark:Landmark
    var landmarkIndex : Int {
        modelData.landmarks.firstIndex(where:{ $0.id == landmark.id
        }) ?? 0
    }
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinates)
                .ignoresSafeArea(edges: .top)
                .frame(height:300)
            CircleImage(image: landmark.image)
                .offset(y:-130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    FavoriteButton(isSet: $modelData.landmarks [landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                }.font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
                
            }
            .padding()
            
            Spacer()
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModeleData()
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
