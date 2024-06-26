/// Copyright (c) 2024
/// BullseyeTests
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

import XCTest
@testable import Bullseye

final class BullseyeTests: XCTestCase {
	var game: Game!
	
	override func setUpWithError() throws {
		game = Game()
	}
	
	override func tearDownWithError() throws {
		game = nil
	}
	
	func testScorePositive() {
		let guess = game.target + 5
		let score = game.points(sliderValue: guess)
		XCTAssertEqual(score, 95)
	}
	
	func testScoreNegative() {
		let guess = game.target - 5
		let score = game.points(sliderValue: guess)
		XCTAssertEqual(score, 95)
	}
	
	func testStartNewRound() {
		game.startNewRound(points: 100)
		XCTAssertEqual(game.score, 100)
		XCTAssertEqual(game.round, 2)
	}
	
	func testScoreExact() {
		let guess = game.target
		let score = game.points(sliderValue: guess)
		XCTAssertEqual(score, 200)
	}
	
	func testScoreClose() {
		let guess = game.target + 2
		let score = game.points(sliderValue: guess)
		XCTAssertEqual(score, 98 + 50)
	}
	
	func testRestart() {
		game.startNewRound(points: 100)
		XCTAssertNotEqual(game.score, 0)
		XCTAssertNotEqual(game.round, 1)
		game.restart()
		XCTAssertEqual(game.score, 0)
		XCTAssertEqual(game.round, 1)
	}
	
	func testLeardboard() {
		game.startNewRound(points: 100)
		XCTAssertEqual(game.leaderboardEntries.count, 1)
		XCTAssertEqual(game.leaderboardEntries[0].score, 100)
		game.startNewRound(points: 200)
		XCTAssertEqual(game.leaderboardEntries.count, 2)
		XCTAssertEqual(game.leaderboardEntries[0].score, 200)
		XCTAssertEqual(game.leaderboardEntries[1].score, 100)
	}
}
