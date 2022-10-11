//
//  ListView.swift
//  ToDoListSwift
//
//  Created by Nortiz M1 on 2022/10/11.
//

import SwiftUI

struct ListView: View {
	
	@EnvironmentObject private var listViewModel: ListViewModel
	
    var body: some View {
		ZStack {
			if listViewModel.items.isEmpty {
				NoItemsView()
					.transition(.opacity.animation(.easeIn))
			} else {
				List {
					ForEach(listViewModel.items) { item in
						ListRowView(item: item)
							.onTapGesture {
								withAnimation(.linear) {
									listViewModel.updateItem(item: item)
								}
							}
					}
					.onDelete(perform: listViewModel.deleteItem)
					.onMove(perform: listViewModel.moveItem)
				}
				.listStyle(.plain)
			}
		}
		
		.navigationTitle("Todo List 📝")
		.toolbar {
			ToolbarItem(placement: .navigationBarLeading) {
				if !listViewModel.items.isEmpty {
					EditButton()
						.font(.headline)
				}
			}
			ToolbarItem(placement: .navigationBarTrailing) {
				if !listViewModel.items.isEmpty {
					NavigationLink("Add") {
						AddView()
					}
					.font(.headline)
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
		.environmentObject(ListViewModel())
    }
}


