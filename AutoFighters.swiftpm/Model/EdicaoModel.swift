//
//  ContentModel.swift
//  URFC
//
//  Created by Vitor Cheung on 11/04/22.
//

import Foundation

class EdicaoModel:ObservableObject{
    @Published var openTextField: Bool
    @Published var showInfoModalView: Bool
    @Published var isNavigationBarHidden: Bool
    
    init() {
        self.isNavigationBarHidden = false
        self.openTextField = false
        self.showInfoModalView = true
    }
}
