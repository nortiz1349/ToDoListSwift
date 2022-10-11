//
//  ListView.swift
//  ToDoListSwift
//
//  Created by Nortiz M1 on 2022/10/11.
//

import SwiftUI

struct ListView: View {
	
	@State var items: [ItemModel] = [
		ItemModel(title: "첫번째 아이템", isCompleted: false),
		ItemModel(title: "두번째 아이템", isCompleted: true),
		ItemModel(title: "세번째 아이템", isCompleted: false)
	]
	
    var body: some View {
		List {
			ForEach(items) { item in
				ListRowView(item: item)
			}
		}
		.listStyle(.plain)
		.navigationTitle("Todo List 📝")
		.toolbar {
			ToolbarItem(placement: .navigationBarLeading) {
				EditButton()
			}
			ToolbarItem(placement: .navigationBarTrailing) {
				NavigationLink("Add") {
					AddView()
				}
			}
		}
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationStack {
			ListView()
		}
    }
}


