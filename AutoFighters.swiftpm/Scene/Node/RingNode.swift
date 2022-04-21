//
//  File.swift
//  
//
//  Created by Vitor Cheung on 14/04/22.
//

import Foundation
import SpriteKit
class RingNode:SKSpriteNode{
    init() {
        super.init(texture: SKTexture(imageNamed: "circulo"), color: .clear, size: CGSize(width: 0, height: 0))
    }
    
    func setupCirculo(width:CGFloat, height:CGFloat){

        self.position = CGPoint(x: width/2, y: height/2)
        var side: CGFloat = 0.0
        if width>height {
            side = height
        }
        else{
            side = width
        }
        self.zPosition = 1
        self.size = CGSize(width: side*0.8,height: side*0.8)
        
        let rect = CGRect(x:-side*0.57, y: -side*0.57, width: side*1.14, height: side*1.14)
        
        let circle = UIBezierPath(ovalIn: rect)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: circle.cgPath)
        self.physicsBody?.contactTestBitMask = (1 << 1)
        self.physicsBody?.collisionBitMask = (1 << 1)
        self.physicsBody?.categoryBitMask = (1 << 1)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
