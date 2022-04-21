//
//  File.swift
//  
//
//  Created by Vitor Cheung on 19/04/22.
//

import Foundation
import SpriteKit
class MenuNode:SKNode{
    
    var backMenu = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    func setup(size:CGSize, funcTryAgain:  @escaping () -> Void, funcBack:  @escaping () -> Void ){
        let background = SKShapeNode(rect: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        background.fillColor = SKColor(hue: 0, saturation: 0, brightness: 0, alpha: 0.5)
        background.zPosition = 10
        addChild(background)
        
        backMenu = SKShapeNode(rect: CGRect(x: -size.width*0.35, y: -size.height*0.2, width: size.width*0.7, height: size.height*0.4), cornerRadius: size.height*0.005 )
        backMenu.position = CGPoint(x: size.width/2, y: size.height/2)
        backMenu.fillColor = SKColor(.gray)
        
        backMenu.zPosition = 11
        addChild(backMenu)
        
        let tryAgainButton = SKButtonNode(imageName: "repeat", action: funcTryAgain)
        tryAgainButton.position = CGPoint(x: size.width/8, y: -backMenu.frame.height/8)
        backMenu.addChild(tryAgainButton)
        
        let backButton = SKButtonNode(imageName: "close", action: funcBack)
        backButton.position = CGPoint(x: -size.width/8, y: -backMenu.frame.height/8)
        backMenu.addChild(backButton)
        
    }
    
    func addLabel(text:String,color:SKColor){
        let label = SKLabelNode(text: text)
        label.fontSize = backMenu.frame.height/8
        label.position = CGPoint(x: 0, y: backMenu.frame.height/8)
        label.fontName = "HelveticaNeue-Bold"
        label.fontColor = color
        backMenu.addChild(label)
    }
}
