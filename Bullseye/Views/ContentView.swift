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

struct ContentView: View {
	@State private var alertIsVisible = false
	@State private var sliderValue = 50.0
	@State private var game = Game()
	
	var body: some View {
		ZStack {
			BackgroundView(game: $game)
			VStack {
				InstructionsView(game: $game)
				SliderView(sliderValue: $sliderValue)
				HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
			}
		}
	}
}

struct InstructionsView: View {
	@Binding var game: Game
	var body: some View {
		VStack {
			InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
				.padding(.horizontal, 30)
			BigNumberText(text: String(game.target))
		}
	}
}

struct SliderView: View {
	@Binding var sliderValue: Double
	var body: some View {
		HStack {
			SliderLabelText(text: "1")
				.frame(width: 35)
			Slider(value: $sliderValue, in: 1.0...100.0)
			SliderLabelText(text: "100")
				.frame(width: 35)
		}
		.padding()
	}
}

struct HitMeButton: View {
	@Binding var alertIsVisible: Bool
	@Binding var sliderValue: Double
	@Binding var game: Game
	var body: some View {
		Button("Hit Me".uppercased()) {
			alertIsVisible = true
		}
		.padding(20)
		.background(
			ZStack {
				Color("ButtonColor")
				LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
			}
		)
		.overlay(
			RoundedRectangle(cornerRadius: 21.0)
				.strokeBorder(Color.white, lineWidth: 2.0)
		)
		.foregroundColor(.white)
		.bold()
		.font(.title3)
		.cornerRadius(21.0)
		.alert("Hello there",
					 isPresented: $alertIsVisible,
					 actions: {
			Button("Awesome!") {
				game.startNewRound(points: game.points(sliderValue: Int(sliderValue)))
			}
		}, message: {
			let roundedValue = Int(sliderValue.rounded())
			Text(
	"""
	This slider value is \(roundedValue),
	You scored \(game.points(sliderValue: roundedValue)) points this round.
	"""
			)
		})
	}
}

#Preview {
	ContentView()
}
