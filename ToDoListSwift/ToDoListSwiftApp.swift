//
//  ToDoListSwiftApp.swift
//  ToDoListSwift
//
//  Created by Nortiz M1 on 2022/10/11.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manages Models for View
 
 */

@main
struct ToDoListSwiftApp: App {
    var body: some Scene {
        WindowGroup {
			NavigationStack {
				ListView()
			}
        }
    }
}
