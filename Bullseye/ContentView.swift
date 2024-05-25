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
	@State private var alertIsVisible: Bool = false
	@State private var sliderValue: Double = 50.0
	
	var body: some View {
		VStack {
			if #available(iOS 16.0, *) {
				Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
					.bold()
					.multilineTextAlignment(.center)
					.lineSpacing(4.0)
					.font(.footnote)
					.kerning(2.0)
			} else {
				Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
					.bold()
					.multilineTextAlignment(.center)
					.lineSpacing(4.0)
					.font(.footnote)
			}
			Text("89")
				.kerning(-1.0)
				.font(.largeTitle)
				.fontWeight(.black)
			HStack {
				Text("1")
					.bold()
				Slider(value: $sliderValue, in: 1.0...100.0)
				Text("100")
					.bold()
			}
			if #available(iOS 15.0, *) {
				Button("Hit Me") {
					alertIsVisible = true
				}
				.alert("Hello there",
							 isPresented: $alertIsVisible,
							 actions: {
					Button("Awesome!") {
						print("Alert closed!")
					}
				}, message: {
					var roundedValue: Int = Int(sliderValue.rounded())
					Text("This slider value is \(roundedValue).")
				})
			} else {
				// TODO: Check lator
				var roundedValue: Int = Int(sliderValue.rounded())
				Button("Hit Me") {
					alertIsVisible = true
				}
				.alert(isPresented: $alertIsVisible) {
					Alert(title: Text("Hello there"),
								message: Text("This is my first Alert!"),
								dismissButton: .default(Text("Awesome!"),
																				action: {
						print("This slider value is \(roundedValue).")
					}))
				}
			}
		}
	}
}

#Preview {
	ContentView()
}
