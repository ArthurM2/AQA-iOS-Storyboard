//
//  XCUIElement+Assert.swift
//  SwiftRadio
//
//  Created by arthur on 03.12.2024.
//  Copyright © 2024 matthewfecher.com. All rights reserved.
//
import XCTest

extension XCUIElement {
    func assertIsSelected() {
        XCTAssertTrue(self.isSelected, "Expected element \(self) is selected")
    }
    
    func assertIsNotSelected() {
        XCTAssertFalse(self.isSelected, "Expected element \(self) is not selected")
    }
    
    func assertIsVisisble() {
        XCTAssertTrue(self.exists, "Expected element \(self) is visible")
    }
    
    func assertIsNotVisible() {
        XCTAssertFalse(self.exists, "Expected element \(self) is not visible")
    }
}
