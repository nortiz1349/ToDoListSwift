//
//  ListRowView.swift
//  ToDoListSwift
//
//  Created by Nortiz M1 on 2022/10/11.
//

import SwiftUI

struct ListRowView: View {
	
	let item: ItemModel
	
	var body: some View {
		HStack {
			Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
				.foregroundColor(item.isCompleted ? .green : .red)
			if item.isCompleted {
				Text(item.title)
					.foregroundColor(.secondary)
					.strikethrough(color: .primary)
			} else {
				Text(item.title)
			}
			
			Spacer()
		}
		.font(.title2)
		.padding(.vertical, 8)
	}
}

struct ListRowView_Previews: PreviewProvider {
	
	static var item1 = ItemModel(title: "첫번째 아이템", isCompleted: false)
	static var item2 = ItemModel(title: "두번째 아이템", isCompleted: true)
	
    static var previews: some View {
		List {
			ListRowView(item: item1)
			ListRowView(item: item2)
		}
		.listStyle(.plain)
    }
}
