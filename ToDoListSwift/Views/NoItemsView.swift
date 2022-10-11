//
//  NoItemsView.swift
//  ToDoListSwift
//
//  Created by Nortiz M1 on 2022/10/11.
//

import SwiftUI

struct NoItemsView: View {
	
	@State private var animate: Bool = false
	private let secondaryAccentColor = Color("SecondaryAccentColor")
	
	var body: some View {
		ScrollView {
			VStack(spacing: 10) {
				Text("목록이 비었습니다!")
					.font(.title)
					.fontWeight(.bold)
				Text("버튼을 클릭해서 해야 할 일을 \n목록에 추가 해보세요!")
					.padding(.bottom, 20)
				NavigationLink("할 일 추가하기 🥳") {
					AddView()
				}
				.foregroundColor(.white)
				.font(.headline)
				.frame(height: 55)
				.frame(maxWidth: .infinity)
				.background(animate ? secondaryAccentColor : Color.accentColor)
				.cornerRadius(10)
				.padding(.horizontal, animate ? 30 : 50)
				.shadow(
					color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
					radius: animate ? 30 : 10,
					x: 0,
					y: animate ? 50 : 30)
				.scaleEffect(animate ? 1.1 : 1.0)
				.offset(y: animate ? -7 : 0)
				
				
			}
			.multilineTextAlignment(.center)
			.padding(40)
			.onAppear(perform: addAnimation)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
	}
	
	func addAnimation() {
		guard !animate else { return }
		DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
			withAnimation(
				Animation
					.easeInOut(duration: 2.0)
					.repeatForever()
			) {
				animate.toggle()
			}
		}
	}
}

struct NoItemsView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationStack {
			NoItemsView()
				.navigationTitle("title")
		}
	}
}
