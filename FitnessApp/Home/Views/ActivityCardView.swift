//
//  ActivityCardView.swift
//  FitnessApp
//
//  Created by Ilya Volkorez on 2025-01-18.
//

import SwiftUI



struct ActivityCardView: View {
    @State var activity: Activity
    var body: some View {
        ZStack{
            Color(uiColor: .systemGray6)
                .cornerRadius(15)
            VStack{
                HStack(alignment: .top){
                    VStack(alignment: .leading, spacing: 8){
                        Text(activity.title)
                        Text(activity.subtitle)
                            .font(.caption)
                    }
                    Spacer()
                    Image(systemName: activity.image)
                        .foregroundColor(activity.tintColor)
                }
                Text(activity.amount)
                    .font(.title)
                    .bold()
                    .padding()
            }
            .padding()
        }
    }
}

#Preview {
    ActivityCardView(activity: Activity(id: 0, title: "Today Steps", subtitle: "Gola 12000", image: "figure.walk", tintColor: .green, amount: "9812"))
}
