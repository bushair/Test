//
//  String+Validation.swift
//  HungrayHub
//
//  Created by Tejinder Paul Singh  on 25/04/18.
//  Copyright © 2018 HungryHub. All rights reserved.
//

import Foundation


extension String {
    /// This will check whether a string is empty or not by remove all spaces
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }

    /// This will check wheher a string is a valid email or not.
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)

    }

    func isValidInRange(minLength min: Int = 0, maxLength max: Int) -> Bool {
        if self.count >= min && self.count <= max {
            return true
        }
        return false
    }

    func replace(_ string: String, replacement: String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: .literal, range: nil)
    }

    var trim: String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }


    var trimmed: String {
        let components = self.components(separatedBy: NSCharacterSet.whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }

    var isValidZip: Bool {
        let postalcodeRegex = "^[0-9]{5}(-[0-9]{4})?|[0-9]{5}$"
        let pinPredicate = NSPredicate(format: "SELF MATCHES %@", postalcodeRegex)
        let bool = pinPredicate.evaluate(with: self) as Bool
        return bool
    }

    var initial: String {
        var initals = String()
        let names = self.components(separatedBy: " ")
        for name in names {
            if let firstChar = name.first {
                initals.append(firstChar)
            }
        }
        return initals
    }

}

//MARK:- Optional extension -
//Usage: textField.text.testOptional
extension Optional where Wrapped == String {
    var isBlank: Bool {
        guard var value = self else { return true }
        value = value.trimmed
        return value.isEmpty
    }

    var testOptional:Bool{
        return true
    }
    var isEmail: Bool {
        guard var email = self else { return false }
        email = email.trimmed
        return email.isEmail
    }

    var trimmed: String {
        guard let str = self else {
            return ""
        }
        return str.trimmed
    }
    var addTrailingAndLeadingSpace: String {
        guard let value = self else { return " " }
        return "    " + value + "   "
    }
}




extension String {
    func matches(for regex: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
            return results.count > 0
        } catch {
            return false
        }
    }
}
