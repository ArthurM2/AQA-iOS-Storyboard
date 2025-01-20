//
//  SwiftRadioUITests.swift
//  SwiftRadioUITests
//
//  Created by Jonah Stiennon on 12/3/15.
//  Copyright © 2015 matthewfecher.com. All rights reserved.
//

import XCTest
import SwiftRadio

class SwiftRadioUITests: XCTestCase {
    let app = XCUIApplication()
    typealias popupId = AccessIDs.PopupInfoView
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        app.launch()
    }
    
    // MARK: - TearDown
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Methods
    func tapElement(withIdentifier identifier: String) {
        let button = app.buttons[identifier]
        
        if button.exists {
            button.tap()
        } else {
            XCTFail("Button with identifier \(identifier) does not exist.")
        }
    }
    
    func tapElement(withIndex index: Int) {
        let index = app.buttons.element(boundBy: index)
        
        if index.isHittable {
            
            index.tap()
        } else {
            XCTFail("Button with index \(index) does not exist")
        }
    }
    
    func tapAt(coordinates x: Double, y: Double) {
        let coordinate = app.coordinate(withNormalizedOffset: CGVector(dx: x, dy: y))
        
        coordinate.tap()
    }
    
    func tapElement(withPredicate predicate: NSPredicate, timeout: TimeInterval = 3) {
        let element = app.descendants(matching: .any).element(matching: predicate)
        
        let exist = element.waitForExistence(timeout: timeout)
        if exist {
            element.tap()
        } else {
            XCTFail("Element with predicate \(predicate) does not exist.")
        }
    }
    
    func closePopup() {
        let closeButton = app.buttons["popupCloseButton"]
        
        if closeButton.isHittable {
            let checkCloseButton = closeButton.wait(for: \.isHittable, toEqual: true, timeout: 5)
            XCTAssertTrue(checkCloseButton)
            closeButton.tap()
        } else {
            XCTFail("Popup button \(closeButton) does not exist.")
        }
    }
    
    func pressBackOrBurgerNavBar() {
        let backButton = app.navigationBars.buttons.element(boundBy: 0)
        
        if backButton.isHittable {
            let checkBackButton = backButton.wait(for: \.isHittable, toEqual: true, timeout: 5)
            XCTAssertTrue(checkBackButton)
            backButton.tap()
        } else {
            XCTFail("Button \(backButton) does not exist.")
        }
    }
}
