//
//  LoopString_Extensions.swift
//  LoopDemo
//
//  Created by BanuchanderJ on 29/12/22.
//

import Foundation
import UIKit
//authorLabel.attributedText = attributedText(withString: String(format: "Author : %@", user.name), boldString: "Author", font: authorLabel.font)
extension String {
    
    func getThinAndBoldMixedString(boldableString: String, thinFont: UIFont, boldFont: UIFont) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self,
                                                         attributes: [NSAttributedString.Key.font: thinFont])
        let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: boldFont]
        let range = (self as NSString).range(of: boldableString)
        attributedString.addAttributes(boldFontAttribute, range: range)
        return attributedString
    }
    
    func getYearFromDateString() -> String{
        // Create Date Formatter
        let dateFormatter = DateFormatter()
        // Set Date Format // 2019-12-25
        dateFormatter.dateFormat = "yyyy-MM-dd"
        // Convert String to Date
        let dateOfMovie = dateFormatter.date(from: self) ?? Date()
        
        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: dateOfMovie)
        return yearString
    }
    
    func getMovieDetailsDateFromDateString() -> String{
        // Create Date Formatter
        let dateFormatter = DateFormatter()
        // Set Date Format // 2019-12-25
        dateFormatter.dateFormat = "yyyy-MM-dd"
        // Convert String to Date
        let dateOfMovie = dateFormatter.date(from: self) ?? Date()
        
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let yearString = dateFormatter.string(from: dateOfMovie)
        return yearString
    }
    
}

extension Int {
    
    func getMovieDetailsMovieRunTimeString() -> String{
        
        let timeInterval = TimeInterval(self * 60)
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        let stringHour = formatter.string(from: timeInterval) ?? ""
        
        let stringMinutes = self % 60
        
        return stringHour + "h " + String(stringMinutes) + "m"
        
    }
    
    func currencyFormatting() -> String {
        let formatter = NumberFormatter()
        formatter.paddingPosition = .afterPrefix
        formatter.paddingCharacter = " "
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 3
        formatter.minimumFractionDigits = 3
        if let str = formatter.string(for: self) {
            return str
        }
        return ""
    }
    
    
    
}

extension Double {
   
    func roundedDecimal(to decimalDigits: Int = 0) -> String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        if let reducedDecimalValue = formatter.string(for: self) {
           return reducedDecimalValue
        }
        return ""
    }
}
