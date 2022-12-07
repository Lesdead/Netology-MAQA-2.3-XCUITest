//
//  Created by Netology.
//  Changet by Zubarev Pavel
//

import XCTest

class NetologyUITests: XCTestCase {

    func testLogin() throws {
        let app = XCUIApplication()
        app.launch()

        let username = "username"

        let loginTextField = app.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText(username)

        let passwordTextField = app.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("123456")

        let loginButton = app.buttons["login"]
        XCTAssertTrue(loginButton.isEnabled)
        loginButton.tap()

        let predicate = NSPredicate(format: "label CONTAINS[c] %@", username)
        let text = app.staticTexts.containing(predicate)
        XCTAssertNotNil(text)

        let fullScreenshot = XCUIScreen.main.screenshot()
        let screenshot = XCTAttachment(screenshot: fullScreenshot)
        screenshot.lifetime = .keepAlways
        add(screenshot)
    }
    
    func testLoginButton() throws {
        let app = XCUIApplication()
        app.launch()
        
        let username = "username"

        let loginTextField = app.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText(username)

        let passwordTextField = app.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("123456")
        
        // пользователь стирает введённый логин
        loginTextField.doubleTap()
        // Не могу найти метод, который может очистить поле ввода
        // loginTextField.typeText("")
        
        let loginButton = app.buttons["login"]
        XCTAssertFalse(loginButton.isHittable)
    }
    
    func testSecondLogin() throws {
        let app = XCUIApplication()
        app.launch()
        
        let username = "username"
        let secondUsername = "Vasya"
        
        let loginTextField = app.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText(username)
        
        let passwordTextField = app.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("123456")
        
        let loginButton = app.buttons["login"]
        XCTAssertTrue(loginButton.isEnabled)
        loginButton.tap()
        
        let backButtion = app.buttons["Login"]
        backButtion.tap()
        
        loginTextField.tap()
        loginTextField.typeText(secondUsername)
        
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", secondUsername)
        let text = app.staticTexts.containing(predicate)
        XCTAssertNotNil(text)
    }
}

