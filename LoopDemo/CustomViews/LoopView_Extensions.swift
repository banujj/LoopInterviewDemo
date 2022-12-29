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
        
        // Apply rounded corners to contentView
        layer.cornerRadius = radius
        layer.masksToBounds = true
               
        // Apply a shadow
//        layer.shadowRadius = 60
//        layer.shadowOpacity = 1
//        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 10)
        
        //self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: radius)
        let shadowLayer = self.layer
        shadowLayer.shadowPath = shadowPath.cgPath
        shadowLayer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowRadius = 60
        shadowLayer.shadowOffset = CGSize(width: 0, height: 10)
        shadowLayer.bounds = self.bounds
        shadowLayer.position = self.center
        //self.layer.addSublayer(shadowLayer)
       

    }
    
    func applyPosterDesignForTableHeader(with imageView:UIImageView){
       
        var shadows = UIView()
        shadows.frame = self.frame
        shadows.clipsToBounds = false
        shadows.backgroundColor = .red
        self.addSubview(shadows)

        let shadowPath0 = UIBezierPath(roundedRect: self.bounds, cornerRadius: 14)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 60
        layer0.shadowOffset = CGSize(width: 0, height: 10)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)

        self.clipsToBounds = true
        self.layer.cornerRadius = 14
       
    }
    
    func applyKeyFactsViewHolderDesign(with radius:CGFloat) {
        
        layer.cornerRadius = radius
        layer.masksToBounds = true

    }
    
}
