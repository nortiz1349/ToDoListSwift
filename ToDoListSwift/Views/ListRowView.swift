//
//  ListRowView.swift
//  ToDoListSwift
//
//  Created by Nortiz M1 on 2022/10/11.
//

import SwiftUI

struct ListRowView: View {
	
	let title: String
	
	var body: some View {
		HStack {
			Image(systemName: "checkmark.circle")
			Text(title)
			Spacer()
		}
	}
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "첫번째 제목")
    }
}
