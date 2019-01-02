//
//  AggrandizementTests.swift
//  ShortcutsSwiftTests
//
//  Created by Alejandro Martinez on 02/01/2019.
//  Copyright © 2019 Pandamonia LLC. All rights reserved.
//

import XCTest
import ShortcutsSwift

class AggrandizementTests: XCTestCase {

    func testDictionary() {
        let dictionaryVariable = actionOutput()
        _ = buildShortcut(
            dictionary(["number": 42]).savingOutput(to: dictionaryVariable) +
            showResult("\(dictionaryVariable.with(valueForKey: "number"))")
        )
    }
    
    func testDateFormat() {
        let result = actionOutput()
        let dateFormat = result.with(dateFormat: .howLongAgoUntil)
        _ = buildShortcut(
            getBatteryLevel().savingOutput(to: result)
            + showResult("Test Aggrandizements \(dateFormat)")
        )
    }
    
    func testProperty() {
        let result = actionOutput()
        let prop = result.with(propertyName: .name, userInfo: .fileSize)
        _ = buildShortcut(
            getBatteryLevel().savingOutput(to: result)
            + showResult("Test Aggrandizements \(prop)")
        )
    }
    
    func testCustomNumberProperty() {
        let result = actionOutput()
        let count = result.with(propertyName: .custom("Count"), userInfo: .number(3))
        _ = buildShortcut(
            getBatteryLevel().savingOutput(to: result)
                + showResult("Test Aggrandizements \(count)")
        )
    }
    
    func testCoercion() {
        let result = actionOutput()
        let coercion = result.with(type: .article)
        _ = buildShortcut(
            getBatteryLevel().savingOutput(to: result)
            + showResult("Test Aggrandizements \(coercion)")
        )
    }
    
    func _testCrash() {
        let result = actionOutput()
        print(" ￼\(result)".unicodeScalars.map({ $0.value })) // Count 79
        print(" \(result)".unicodeScalars.map({ $0.value })) // Count 78
        _ = buildShortcut(
            getBatteryLevel().savingOutput(to: result)
            + showResult(" ￼\(result)") // This first space is not a normal space.
        )
    }

}
