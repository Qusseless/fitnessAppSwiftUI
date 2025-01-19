//
//  HealthKitManager.swift
//  FitnessApp
//
//  Created by Ilya Volkorez on 2025-01-18.
//

import SwiftUI
import HealthKit


class HealthKitManager: ObservableObject {
    private let healthStore = HKHealthStore()
    
    func requestAuthorization(completion: @escaping (Result<Void, Error>) -> Void) {
        let typesToRead: Set = [
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!
        ]
        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { success, error in
            if success {
                completion(.success(()))
            } else if let error = error {
                completion(.failure(error))
            } else {
                completion(.failure(NSError(domain: "com.fitnessapp.error", code: 0, userInfo: [NSLocalizedDescriptionKey : "Unknown authorization error"])))
            }
        }
    }
    
    func fetchStepCount(completion: @escaping (Result<Double, Error>) -> Void) {
        guard let stepType = HKObjectType.quantityType(forIdentifier: .stepCount) else {
            completion(.failure(NSError(domain: "com.fitnessapp.error", code: 1, userInfo: [NSLocalizedDescriptionKey: "Step count type unavailable"])))
            return
        }
        
        let startDate = Calendar.current.startOfDay(for: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date())
        
        let query = HKStatisticsQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            if let error = error {
                completion(.failure(error))
            } else if let result = result, let steps = result.sumQuantity()?.doubleValue(for: .count()) {
                completion(.success(steps))
            } else {
                completion(.failure(NSError(domain: "com.fitnessapp.error", code: 2, userInfo: [NSLocalizedDescriptionKey: "No step data availalbe"])))
            }
        }
        healthStore.execute(query)
    }
    
    func fetchActiveEnergy(completion: @escaping (Result<Double, Error>) -> Void) {
        guard let energyType = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned) else {
            completion(.failure(NSError(domain: "com.fitnessapp.error", code: 3, userInfo: [NSLocalizedDescriptionKey: "Active energy tyoe unavailable"])))
            return
        }
        
        let startDate = Calendar.current.startOfDay(for: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date())
        
        let query = HKStatisticsQuery(quantityType: energyType, quantitySamplePredicate: predicate, options: .cumulativeSum){_, result, error in
            if let error = error {
                completion(.failure(error))
            } else if let result = result, let energy = result.sumQuantity()?.doubleValue(for: .kilocalorie()) {
                completion(.success(energy))
            } else {
                completion(.failure(NSError(domain: "com.fitness.error", code: 4, userInfo: [NSLocalizedDescriptionKey: "Active energy unavailable"])))
                }
            }
        healthStore.execute(query)
        }
    func fetchStandTime(completion: @escaping (Result<Double, Error>) -> Void) {
        guard let standTime = HKObjectType.quantityType(forIdentifier: .appleStandTime) else {
            completion(.failure(NSError(domain: "com.fitnessapp.error", code: 5, userInfo: [NSLocalizedDescriptionKey: "Stand Time data is unavailable"])))
            return
        }
        
        let startDate = Calendar.current.startOfDay(for: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date())
        
        let query = HKStatisticsQuery(quantityType: standTime, quantitySamplePredicate: predicate, options: .cumulativeSum){_, result, error in
            if let error = error {
                completion(.failure(error))
            } else if let result = result, let standTime = result.sumQuantity()?.doubleValue(for: .count()) {
                completion(.success(standTime))
            } else {
                completion(.failure(NSError(domain: "com.fitness.error", code: 4, userInfo: [NSLocalizedDescriptionKey: "Stand Time unavailable"])))
                }
            }
        healthStore.execute(query)
        }
    }
    
                                                                                                 
