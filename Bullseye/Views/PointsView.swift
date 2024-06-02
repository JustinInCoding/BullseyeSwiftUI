/// Copyright (c) 2024
/// Bullseye
/// Justin    
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct PointsView: View {
	@Binding var alertIsVisible: Bool
	@Binding var sliderValue: Double
	@Binding var game: Game

	var body: some View {
		let roundedValue = Int(sliderValue.rounded())
		let points = game.points(sliderValue: roundedValue)
		VStack(spacing: 10) {
			InstructionText(text: "The Slider's Value is")
			BigNumberText(text: String(roundedValue))
			BodyText(text: "Tou scored \(points) points\n🎉🎉🎉")
			Button {
				alertIsVisible.toggle()
				game.startNewRound(points: points)
			} label: {
				ButtonText(text: "Start New Round")
			}
		}
			.padding()
			.frame(maxWidth: 300)
			.background(
				Color("BackgroundColor")
			)
			.cornerRadius(21.0)
			.shadow(radius: 10.0, x: 5.0, y: 5.0)
	}
}


var alertIsVisible = Binding.constant(true)
var sliderValue = Binding.constant(50.0)
var game = Binding.constant(Game())

#Preview {
	PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
}
