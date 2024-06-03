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

struct LeaderboardView: View {
	@Binding var leaderboardIsShowing: Bool
	@Binding var game: Game
	
	var body: some View {
		ZStack {
			Color("BackgroundColor").ignoresSafeArea()
			VStack {
				HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
				LabelView()
				ScrollView {
					VStack(spacing: 10) {
						ForEach(game.leaderboardEntries.indices, id: \.self) { index in
							let entry = game.leaderboardEntries[index]
							RowView(index: index + 1, score: entry.score, date: entry.date)
						}
					}
				}
			}
		}
	}
}

struct HeaderView: View {
	@Environment(\.verticalSizeClass) var verticalSizeClass
	@Environment(\.horizontalSizeClass) var horizontalSizeClass
	@Binding var leaderboardIsShowing: Bool
	
	var body: some View {
		ZStack {
			HStack {
				BigBoldText(text: "Leaderboard")
				if horizontalSizeClass == .compact && verticalSizeClass == .regular {
					Spacer()
				}
			}
			HStack {
				Spacer()
				Button {
					leaderboardIsShowing = false
				} label: {
					RoundedImageViewFilled(systemName: "xmark")
				}
			}
		}
		.padding([.horizontal, .top])
	}
}

struct LabelView: View {
	var body: some View {
		HStack {
			Spacer()
				.frame(width: Constants.General.roundedViewLength)
			Spacer()
			LabelText(text: "Score")
				.frame(width: Constants.Leaderboard.scoreColumnWidth)
			Spacer()
			LabelText(text: "Date")
				.frame(width: Constants.Leaderboard.dateColumnWidth)
		}
		.padding(.horizontal)
		.frame(maxWidth: Constants.Leaderboard.maxRowWidth)
	}
}

struct RowView: View {
	let index: Int
	let score: Int
	let date: Date

	var body: some View {
		HStack {
			RoundedTextViewStroked(text: String(index))
			Spacer()
			ScoreText(score: score)
				.frame(width: Constants.Leaderboard.scoreColumnWidth)
			Spacer()
			DateText(date: date)
				.frame(width: Constants.Leaderboard.dateColumnWidth)
		}
		.background(
			RoundedRectangle(cornerRadius: .infinity)
				.strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
		)
		.padding(.horizontal)
		.frame(maxWidth: Constants.Leaderboard.maxRowWidth)
	}
}

#Preview {
	LeaderboardView(leaderboardIsShowing: .constant(false), game: .constant(Game(showData: true)))
}
