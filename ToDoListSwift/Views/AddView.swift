//
//  AddView.swift
//  ToDoListSwift
//
//  Created by Nortiz M1 on 2022/10/11.
//

import SwiftUI

struct AddView: View {
	
	@Environment(\.dismiss) private var dismiss
	@FocusState private var textFieldInFocus: Bool
	
	@EnvironmentObject var listViewModel: ListViewModel
	@State private var textFieldText: String = ""
	
	var body: some View {
		ScrollView {
			VStack(spacing: 20) {
				TextField("입력하세요...", text: $textFieldText)
					.focused($textFieldInFocus)
					.padding(.horizontal)
					.frame(height: 55)
					.background(Color(UIColor.secondarySystemBackground))
					.cornerRadius(10)
				
				Button {
					saveButtonPressed()
				} label: {
					Text("저장")
						.font(.headline)
						.foregroundColor(.white)
						.frame(height: 55)
						.frame(maxWidth: .infinity)
						.background(Color.accentColor)
						.cornerRadius(10)
				}
				.disabled(!textIsAppropriate())
				
			}
			.padding(14)
		}
		.onAppear() {
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
				textFieldInFocus = true
			}
		}
		.navigationTitle("할 일을 입력하세요 🖋")
	}
	
	func saveButtonPressed() {
		if textIsAppropriate() {
			listViewModel.addItem(title: textFieldText)
			dismiss()
		}
		
	}
	
	func textIsAppropriate() -> Bool {
		if textFieldText.count < 3 {
			return false
		}
		return true
	}
}

struct AddView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationStack {
			AddView()
		}
		.environmentObject(ListViewModel())
	}
}
