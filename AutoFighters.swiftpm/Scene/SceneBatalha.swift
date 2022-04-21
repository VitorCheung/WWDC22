//
//  SceneBatalha.swift
//  URFC
//
//  Created by Vitor Cheung on 13/04/22.
//

import Foundation
import SpriteKit
import SwiftUI

class SceneBatalha:SKScene{
    
    var dismiss: (()->Void)?
    var circuloNode = RingNode()
    var playerRoombaNode = RoombaNode(imgName: "roombaDefault",automato: Automato.shared)
    var enemyRoombaNode =  RoombaNode(imgName: "enemyDefault",automato: EnemyAutomato().automato)
    
    override init() {
        super.init(size: CGSize(width: 1, height: 1))
        self.scaleMode = .resizeFill
        physicsWorld.contactDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        setup()
    }
    
    override func didMove(to view: SKView) {
        if playerRoombaNode.automato.start != nil{
            
            playerRoombaNode.switcherEvent()
            enemyRoombaNode.switcherEvent()
            
            playerRoombaNode.timeEvent()
            enemyRoombaNode.timeEvent()
            
        }
    }
    
    func setDismiss(action: @escaping () -> Void){
        self.dismiss = action
    }
    
    func setup(){
        removeAllChildren()
        physicsWorld.contactDelegate = self
        let height = self.frame.size.height
        let width = self.frame.size.width
        
        circuloNode.setupCirculo(width: width, height: height)
        circuloNode.name = "ring"
        
        enemyRoombaNode.setupRoomba (location: height/2+circuloNode.size.width/4,ring:circuloNode )
        enemyRoombaNode.name = "enemy"
        
        playerRoombaNode.setupRoomba(location: height/2-circuloNode.size.width/4,ring:circuloNode)
        playerRoombaNode.name = "player"
        
        addChild(circuloNode)
        addChild(enemyRoombaNode)
        addChild(playerRoombaNode)
        drawBackground(side: 250)
        
        playerRoombaNode.setupCount()
        enemyRoombaNode.setupCount()
        playerRoombaNode.direction = .up
        enemyRoombaNode.direction = .down
        playerRoombaNode.restartIndex()
        enemyRoombaNode.restartIndex()
        
    }
    
    func drawBackground(side: CGFloat) {
        let width = self.frame.size.width
        let height = self.frame.size.height
        
        for i in 0...Int(width/side)+1 {
            for j in 0...Int(height/side)+1 {
                let backgroundWallNode = SKSpriteNode(imageNamed: "Background")
                backgroundWallNode.size = CGSize(width: side, height: side)
                addChild(backgroundWallNode)
                backgroundWallNode.position = CGPoint(x: backgroundWallNode.size.width*CGFloat(i), y: backgroundWallNode.size.height*CGFloat(j))
                backgroundWallNode.zPosition = -2
                
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        enemyRoombaNode.distanceEvent()
        playerRoombaNode.distanceEvent()
    }
    
}

extension SceneBatalha: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        guard let name1 = contact.bodyA.node?.name else { return }
        guard let name2 = contact.bodyB.node?.name else { return }
        guard let dismiss = dismiss else { return }
        let menu = MenuNode()
        menu.setup(size: self.frame.size, funcTryAgain: setup, funcBack: dismiss)
        if name1 == "enemy" && name2 == "ring" || name2 == "enemy" && name1 == "ring" {
            menu.addLabel(text: "YOU WON!!!",color: SKColor(red: 65/255, green: 229/255, blue: 53/255, alpha: 1))
            physicsWorld.contactDelegate = nil
            addChild(menu)
        }
        else if name1 == "player" && name2 == "ring" || name2 == "player" && name1 == "ring" {
            menu.addLabel(text: "YOU LOST!!!",color: SKColor(red: 167/255, green: 15/255, blue: 15/255, alpha: 1))
            physicsWorld.contactDelegate = nil
            addChild(menu)
        }
        else{
            playerRoombaNode.touchEvent()
            enemyRoombaNode.touchEvent()
        }
    }
}

