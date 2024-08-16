//
//  StringExtensionTests.swift
//  TGBaseTests
//
//  Created by kim on 2024/8/15.
//

import XCTest
@testable import TGBase

class StringExtenstionTests: XCTestCase {

}

// MARK: - 邮箱验证
extension StringExtenstionTests {
    func testValidEmails() {
        let validEmails = [
            "example@example.com",
            "user.name+tag+sorting@example.com",
            "user_name@example.com",
            "user-name@example.com",
            "user.name@subdomain.example.com"
        ]
        
        for email in validEmails {
            XCTAssertTrue(email.isEmail, "\(email) 应该是有效的邮箱地址")
        }
    }

    func testInvalidEmails() {
        let invalidEmails = [
            "plainaddress",
            "@missingusername.com",
            "username@.com",
            "username@domain..com",
            "username@domain.com.",
            "user@name@domain.com",
            "user.name@domain@com"
        ]
        
        for email in invalidEmails {
            XCTAssertFalse(email.isEmail, "\(email) 不应该是有效的邮箱地址")
        }
    }
}

// MARK: - 手机号码验证
extension StringExtenstionTests {
    func testValidPhoneNumbers() {
        let validPhones = [
            "138 1234 5678", // 中国号码
            "13812345678" // 不加区号
        ]
        
        for phone in validPhones {
            XCTAssertTrue(phone.isChinaPhone, "\(phone) 应该是有效的手机号码")
        }
    }

    func testInvalidPhoneNumbers() {
        let invalidPhones = [
            "123456789",         // 不符合格式
            "+1234 5678 91011",  // 长度超出
            "abc-123-4567",      // 非数字
            "+12 34",            // 格式不合规定
            "123-hello-4567"     // 包含字母
        ]
        
        for phone in invalidPhones {
            XCTAssertFalse(phone.isChinaPhone, "\(phone) 不应该是有效的手机号码")
        }
    }
}

// MARK: - 数字格式化测试
extension StringExtenstionTests {
    func testThousandFormat() {
        XCTAssertEqual(String.thousandFormat(12345), "12,345")
        XCTAssertEqual(String.thousandFormat(1234567), "1,234,567")
        XCTAssertEqual(String.thousandFormat(1234.56, fractionDigits: 2), "1,234.56")
        XCTAssertEqual(String.thousandFormat(1234.5678, fractionDigits: 2), "1,234.57")
        XCTAssertEqual(String.thousandFormat(0), "0")
        XCTAssertEqual(String.thousandFormat(-98765), "-98,765")
    }
    
    // 测试其他类型
    func testThousandFormatWithDifferentNumericTypes() {
        XCTAssertEqual(String.thousandFormat(Float(54321.98), fractionDigits: 2)!, "54,321.98")
        XCTAssertEqual(String.thousandFormat(Double(1234567890123.45), fractionDigits: 2)!, "1,234,567,890,123.45")
        XCTAssertEqual(String.thousandFormat(Int(999999))!, "999,999")
    }
}
