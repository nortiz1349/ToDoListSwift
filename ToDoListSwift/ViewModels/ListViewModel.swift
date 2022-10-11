//
//  ListViewModel.swift
//  ToDoListSwift
//
//  Created by Nortiz M1 on 2022/10/11.
//

import Foundation

/*
 CRUD FUNCTIONS
 
 Create
 Read
 Update
 Delete
 
 */


class ListViewModel: ObservableObject {
	
	@Published var items: [ItemModel] = []
	
	init() {
		getItems()
	}
	
	func getItems() {
		let newItems = [
			ItemModel(title: "첫번째 아이템", isCompleted: false),
			ItemModel(title: "두번째 아이템", isCompleted: true),
			ItemModel(title: "세번째 아이템", isCompleted: false)
		]
		items.append(contentsOf: newItems)
	}
	
	func deleteItem(indexSet: IndexSet) {
		items.remove(atOffsets: indexSet)
	}
	
	func moveItem(from: IndexSet, to: Int) {
		items.move(fromOffsets: from, toOffset: to)
	}
	
	func addItem(title: String) {
		let newItem = ItemModel(title: title, isCompleted: false)
		items.append(newItem)
	}
	
	func updateItem(item: ItemModel) {
		if let index = items.firstIndex(where: { $0.id == item.id }) {
			items[index] = item.updateCompletion()
		}
	}
}