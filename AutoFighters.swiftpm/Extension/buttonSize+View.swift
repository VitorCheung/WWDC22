//
//  size+View.swift
//  URFC
//
//  Created by Vitor Cheung on 14/04/22.
//

import Foundation
import SwiftUI
extension View{
    var buttonSize:CGFloat{
        if  UIScreen.main.bounds.width > UIScreen.main.bounds.height{
            return UIScreen.main.bounds.width/10
        }
        else{
            return UIScreen.main.bounds.height/10
        }
    }
}
