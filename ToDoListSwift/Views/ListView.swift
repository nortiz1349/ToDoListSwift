//
//  ListView.swift
//  ToDoListSwift
//
//  Created by Nortiz M1 on 2022/10/11.
//

import SwiftUI

struct ListView: View {
	
	@State var items: [String] = [
		"첫번째 제목",
		"두번째 제목",
		"세번째!"
	]
	
    var body: some View {
		List {
			ForEach(items, id: \.self) { item in
				ListRowView(title: item)
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


