//
//  LoopView_Extensions.swift
//  LoopDemo
//
//  Created by BanuchanderJ on 29/12/22.
//

import Foundation
import UIKit

extension UIView {
    
    func applyPosterDesign(with radius:CGFloat) {
        
        layer.cornerRadius = radius
        layer.masksToBounds = true
       
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: radius)
        let shadowLayer = self.layer
        shadowLayer.shadowPath = shadowPath.cgPath
        shadowLayer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowRadius = 60
        shadowLayer.shadowOffset = CGSize(width: 0, height: 10)
        shadowLayer.bounds = self.bounds
        shadowLayer.position = self.center
       

    }
    
    
    func applyKeyFactsViewHolderDesign(with radius:CGFloat) {
        
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        
    }
    
}
