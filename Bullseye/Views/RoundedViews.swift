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

struct RoundedImageViewStroked: View {
	var systemName: String
	var body: some View {
		Image(systemName: systemName)
			.font(.title)
			.foregroundColor(Color("TextColor"))
			.frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
			.overlay(
				Circle()
					.strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
			)
	}
}

struct RoundedImageViewFilled: View {
	var systemName: String
	var body: some View {
		Image(systemName: systemName)
			.font(.title)
			.foregroundColor(Color("ButtonFilledTextColor"))
			.frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
			.background(
				Circle()
					.fill(Color("ButtonFilledBackgroundColor"))
			)
	}
}

struct RoundRectTextView: View {
	var text: String
	var body: some View {
		Text(text)
			.kerning(-0.2)
			.bold()
			.font(.title3)
			.frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
			.foregroundColor(Color("TextColor"))
			.overlay(
				RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
					.stroke(lineWidth: Constants.General.strokeWidth)
					.foregroundColor(Color("ButtonStrokeColor"))
			)
	}
}

struct PreviewView: View {
	var body: some View {
		VStack(spacing: 10) {
			RoundedImageViewStroked(systemName: "list.dash")
			RoundedImageViewFilled(systemName: "arrow.counterclockwise")
			RoundRectTextView(text: "999")
		}
	}
}

#Preview {
	PreviewView()
//	PreviewView()
//		.preferredColorScheme(.dark)
}
