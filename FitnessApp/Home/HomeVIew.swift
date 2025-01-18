//
//  HomeVIew.swift
//  FitnessApp
//
//  Created by Ilya Volkorez on 2025-01-18.
//

import SwiftUI

struct HomeVIew: View {
    @State var colories: Int = 123
    @State var active: Int = 52
    @State var stand: Int = 3
    private let kcalGoal: Int = 600
    private let activeGoal: Int  = 90
    private let standGoal: Int = 8
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading){
                Text("Welcome")
                    .font(.largeTitle)
                    .padding()
                HStack{
                    
                    Spacer()
                    
                    VStack{
                        VStack(alignment: .leading, spacing: 8){
                            Text("Callories")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.red)
                            
                            Text("123 kcal")
                                .bold()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8){
                            Text("Active")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.green)
                            
                            Text("52 mins")
                                .bold()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8){
                            Text("Stand")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.blue)
                            
                            Text("8 hours")
                                .bold()
                        }
                    }
                    Spacer()
                    
                    ZStack{
                        ProgressCircleView(progress: $colories, goal: kcalGoal, color: .red)
                        ProgressCircleView(progress: $active, goal: activeGoal, color: .green)
                            .padding(.all, 20)
                        ProgressCircleView(progress: $stand, goal: standGoal, color: .blue)
                            .padding(.all, 40)
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                .padding(.horizontal)
                HStack{
                    Text("Fitness Activity")
                        .font(.title2)
                    Spacer()
                    Button{
                        print("show more")
                    } label: {
                        Text("Show more")
                            .padding(.all, 10)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(20)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    HomeVIew()
}
