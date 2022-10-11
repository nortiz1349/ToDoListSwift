//
//  AddView.swift
//  ToDoListSwift
//
//  Created by Nortiz M1 on 2022/10/11.
//

import SwiftUI

struct AddView: View {
	
	@State var textFieldText: String = ""
	
    var body: some View {
		ScrollView {
			VStack {
				TextField("입력하세요...", text: $textFieldText)
					.padding(.horizontal)
					.frame(height: 55)
					.background(Color(UIColor.secondarySystemBackground))
				.cornerRadius(10)
				
				Button {
					
				} label: {
					Text("Save".uppercased())
						.font(.headline)
						.foregroundColor(.white)
						.frame(height: 55)
						.frame(maxWidth: .infinity)
						.background(Color.accentColor)
						.cornerRadius(10)
				}

			}
			.padding(14)
		}
		.navigationTitle("Add an Item 🖋")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationStack {
			AddView()
		}
    }
}
