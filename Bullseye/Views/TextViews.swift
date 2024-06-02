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

struct InstructionText: View {
	var text: String

	var body: some View {
		Text(text.uppercased())
			.bold()
			.multilineTextAlignment(.center)
			.lineSpacing(4.0)
			.font(.footnote)
			.kerning(2.0)
			.foregroundColor(Color("TextColor"))
	}
}

struct BigNumberText: View {
	var text: String
	var body: some View {
		Text(text)
			.kerning(-1.0)
			.font(.largeTitle)
			.fontWeight(.black)
			.foregroundColor(Color("TextColor"))
	}
}

struct SliderLabelText: View {
	var text: String
	var body: some View {
		Text(text)
			.bold()
			.foregroundColor(Color("TextColor"))
	}
}

struct LabelText: View {
	var text: String
	var body: some View {
		Text(text.uppercased())
			.bold()
			.font(.caption)
			.kerning(1.5)
			.foregroundColor(Color("TextColor"))
	}
}

struct BodyText: View {
	var text: String
	var body: some View {
		Text(text)
			.fontWeight(.semibold)
			.font(.subheadline)
			.multilineTextAlignment(.center)
			.lineSpacing(12.0)
	}
}

struct ButtonText: View {
	var text: String
	var body: some View {
		Text(text)
			.bold()
			.foregroundColor(.white)
			.padding()
			.frame(maxWidth: .infinity)
			.background(
				Color.accentColor
			)
			.cornerRadius(12.0)
	}
}

#Preview {
	VStack {
		InstructionText(text: "Instruction View")
		BigNumberText(text: "999")
		SliderLabelText(text: "1")
		LabelText(text: "Score")
		BodyText(text: "You scored 73 points\n😍😍😍")
		ButtonText(text: "Start New Round")
	}
	.padding()
}
