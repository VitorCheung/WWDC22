//
//  File.swift
//  
//
//  Created by Vitor Cheung on 14/04/22.
//

import Foundation
import SpriteKit
class RoombaNode:SKSpriteNode{
    var direction: EstadosEnum = EstadosEnum.up
    let automato: Automato
    var index:Int?
    var timeCount = 0.0
    var startDistance:CGPoint = CGPoint()
    
    init(imgName:String, automato:Automato) {
        self.automato = automato
        self.index = automato.start
        super.init(texture: SKTexture(imageNamed: imgName), color: .clear, size: CGSize(width: 0, height: 0))
    }
    
    func setupRoomba(location: CGFloat, ring:RingNode) {
        self.position = CGPoint(x: ring.position.x, y: location)
        startDistance = self.position
        self.size = CGSize(width: ring.size.width/5,height: ring.size.width/5)
        self.zPosition = 1
        self.physicsBody = SKPhysicsBody(circleOfRadius: ring.size.width/10)
        self.physicsBody?.mass = 1
        self.physicsBody?.contactTestBitMask = (1 << 1)
        self.physicsBody?.collisionBitMask = (1 << 1)
        self.physicsBody?.categoryBitMask = (1 << 1)
        self.physicsBody?.affectedByGravity = false
    }
    
    func actionRoomba(enumRoomba:EstadosEnum){
        switch enumRoomba {
        case .left:
            self.physicsBody?.velocity = CGVector(dx: -size.width*2, dy: 0)
            direction = EstadosEnum.left
            zRotation = .pi/2
        case .right:
            self.physicsBody?.velocity = CGVector(dx: size.width*2, dy: 0)
            direction = EstadosEnum.right
            zRotation = .pi*3/2 
        case .up:
            self.physicsBody?.velocity = CGVector(dx: 0, dy: size.width*2)
            zRotation = 0
            direction = EstadosEnum.up
        case .down:
            self.physicsBody?.velocity = CGVector(dx: 0, dy: -size.width*2)
            zRotation = .pi
            direction = EstadosEnum.down
        case .impulse:
            impulse()
        }
    }
    
    func setupCount(){
        timeCount = 0.0
        startDistance = self.position
    }
    
    func restartIndex(){
        index = automato.start
    }
    
    private func impulse(){
        switch direction {
        case .left:
            self.physicsBody?.applyForce(CGVector(dx: -size.width*500, dy: 0))
        case .right:
            self.physicsBody?.applyForce(CGVector(dx: size.width*500, dy: 0))
        case .up:
            self.physicsBody?.applyForce(CGVector(dx: 0, dy: size.width*500))
        case .down:
            self.physicsBody?.applyForce(CGVector(dx: 0, dy: -size.width*500))
        case .impulse:
            fatalError("direcao não possui estado impulse")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchEvent(){
        if let ligacao = self.automato.getLigacao(index: self.index, tipoLigacao: LigacaoEnum.touch){
            self.index = ligacao.endEstado.id
            self.setupCount()
        }
    }
    func distanceEvent(){
        if let ligacao = self.automato.getLigacao(index: self.index, tipoLigacao: LigacaoEnum.distance){
            if self.direction == EstadosEnum.up || self.direction == EstadosEnum.down{
                if CGFloat(ligacao.quantidade) < abs(self.startDistance.y - self.position.y) {
                    self.setupCount()
                    self.index = ligacao.endEstado.id
                }
            }
            else{
                if CGFloat(ligacao.quantidade) < abs(self.startDistance.x - self.position.x) {
                    self.setupCount()
                    self.index = ligacao.endEstado.id
                }
            }
            
        }
    }
    
    func timeEvent(){
        self.run(
            SKAction.repeatForever(
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.1),
                        SKAction.run {
                            guard let index = self.index else { return }
                            if let estado = self.automato.estados[index] {
                                self.actionRoomba(enumRoomba: estado.estado)
                            }
                            self.timeCount += 0.1
                    }
                ])
            )
        )
    }
    
    func switcherEvent(){
        self.run(
            SKAction.repeatForever(
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.1),
                        SKAction.run {
                            if let ligacao = self.automato.getLigacao(index: self.index, tipoLigacao: LigacaoEnum.time){
                                if self.timeCount >= Double(ligacao.quantidade){
                                    self.index = ligacao.endEstado.id
                                    self.setupCount()
                                }
                            }
                    }
                ])
            )
        )
    }
    
}
