//
//  KeyFactsView.swift
//  LoopDemo
//
//  Created by BanuchanderJ on 29/12/22.
//

import UIKit
import Reusable


final class KeyFactsView: UIView,NibOwnerLoadable{
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblValue: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadNibContent()
    }
    
    func loadKeyFacts(with title:String, value:String){
        lblTitle.text = title
        lblValue.text = value
        self.applyKeyFactsViewHolderDesign(with: 12)
    }
    
}
