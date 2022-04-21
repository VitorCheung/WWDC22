//
//  SKButton.swift
//  AutoFighters
//
//  Created by Vitor Cheung on 06/04/22.
//

import Foundation
import SpriteKit

class SKButtonNode: SKSpriteNode{

    var action: (()->Void)
    
    init(imageName: String,action: @escaping () -> Void){
        let texture = SKTexture(imageNamed: imageName)
        self.action = action
        super.init(texture: texture, color: .clear, size: CGSize(width: 75, height: 75))
        self.alpha = 0.5
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.action()
    }
    
}
