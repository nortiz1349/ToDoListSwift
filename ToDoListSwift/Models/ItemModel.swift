//
//  ItemModel.swift
//  ToDoListSwift
//
//  Created by Nortiz M1 on 2022/10/11.
//

import Foundation

struct ItemModel: Identifiable {
	let id: String = UUID().uuidString
	let title: String
	let isCompleted: Bool
}
