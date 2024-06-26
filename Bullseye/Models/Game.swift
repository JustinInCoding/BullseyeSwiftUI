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

import Foundation

struct Game {
	var target = Int.random(in: 1...100)
	var score = 0
	var round = 1
	var leaderboardEntries: [LeaderboardEntry] = []
	
	init(showData: Bool = false) {
		if showData {
			leaderboardEntries = [
				LeaderboardEntry(score: 100, date: Date()),
				LeaderboardEntry(score: 80, date: Date()),
				LeaderboardEntry(score: 200, date: Date()),
				LeaderboardEntry(score: 50, date: Date()),
				LeaderboardEntry(score: 40, date: Date()),
				LeaderboardEntry(score: 20, date: Date()),
			]
		}
	}
	
	func points(sliderValue: Int) -> Int {
		let difference = abs(target - sliderValue)
		var bonus: Int
		if difference == 0 {
			bonus = 100
		} else if difference <= 2 {
			bonus = 50
		} else {
			bonus = 0
		}
		return 100 - difference + bonus
	}
	
	mutating func startNewRound(points: Int) {
		addToLeaderboard(score: points)
		score += points
		round += 1
		target = Int.random(in: 1...100)
	}
	
	mutating func restart() {
		score = 0
		round = 1
		target = Int.random(in: 1...100)
	}
	
	mutating func addToLeaderboard(score: Int) {
		leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
		leaderboardEntries.sort { entry1, entry2 in
			entry1.score > entry2.score
		}
	}
}

struct LeaderboardEntry {
	let score: Int
	let date: Date
}
