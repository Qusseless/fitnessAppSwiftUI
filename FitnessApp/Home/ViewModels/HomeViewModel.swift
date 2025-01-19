//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Ilya Volkorez on 2025-01-18.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @State var colories: Int = 123
    @State var active: Int = 52
    @State var stand: Int = 3
    //We should also add @Published to the variables that will change so the HomeViewModel updates when changes accur
    var mockActivities = [
        Activity(id: 0, title: "Today Steps", subtitle: "Goal 12000", image: "figure.walk", tintColor: .green, amount: "9812"),
        Activity(id: 1, title: "Today Steps", subtitle: "Goal 12000", image: "figure.walk", tintColor: .red, amount: "9812"),
        Activity(id: 2, title: "Today Steps", subtitle: "Goal 12000", image: "figure.walk", tintColor: .blue, amount: "9812"),
        Activity(id: 3, title: "Today Steps", subtitle: "Goal 12000", image: "figure.walk", tintColor: .purple, amount: "9812")
    ]
    var mockWorkouts = [
        Workout(id: 0, title: "Running", image: "figure.run", tintColor: .green, duration: "15 min", date: "Jan 17", calories: "187 kcal"),
        Workout(id: 1, title: "Running", image: "figure.run", tintColor: .red, duration: "15 min", date: "Jan 17", calories: "187 kcal"),
        Workout(id: 2, title: "Running", image: "figure.run", tintColor: .blue, duration: "15 min", date: "Jan 17", calories: "187 kcal"),
        Workout(id: 3, title: "Running", image: "figure.run", tintColor: .purple, duration: "15 min", date: "Jan 17", calories: "187 kcal")
        
    ]
}
