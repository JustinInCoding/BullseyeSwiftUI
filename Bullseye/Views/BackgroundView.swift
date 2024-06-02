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

struct BackgroundView: View {
	@Binding var game: Game
	
	var body: some View {
		VStack {
			TopView(game: $game)
			Spacer()
			BottomView(game: $game)
		}
		.padding()
		.background(
			RingView()
		)
	}
}

struct TopView: View {
	@Binding var game: Game
	var body: some View {
		HStack {
			Button {
				game.restart()
			} label: {
				RoundedImageViewStroked(systemName: "arrow.counterclockwise")
			}
			Spacer()
			RoundedImageViewFilled(systemName: "list.dash")
		}
	}
}

struct NumberView: View {
	var title: String
	var text: String
	
	var body: some View {
		VStack(spacing: 5) {
			LabelText(text: title)
			RoundRectTextView(text: text)
		}
	}
}

struct BottomView: View {
	@Binding var game: Game
	
	var body: some View {
		HStack {
			NumberView(title: "Score", text: String(game.score))
			Spacer()
			NumberView(title: "Round", text: String(game.round))
		}
	}
}

struct RingView: View {
	var body: some View {
		ZStack {
			Color("BackgroundColor")
				.ignoresSafeArea()
			ForEach(1..<6) { ring in
				let size = CGFloat(ring * 100)
				Circle()
					.stroke(lineWidth: 20)
					.fill(
						RadialGradient(
							gradient: Gradient(colors: [Color("RingsColor").opacity(0.8 * 0.3), Color("RingsColor").opacity(0.0)]),
							center: .center, startRadius: 100, endRadius: 300)
					)
					.frame(width: size, height: size)
			}
		}
	}
}

#Preview {
	BackgroundView(game: .constant(Game()))
}
