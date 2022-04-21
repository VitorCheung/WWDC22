//
//  LigacaoNode.swift
//  AutoFighters
//
//  Created by Vitor Cheung on 06/04/22.
//

import Foundation
import SpriteKit
class LigacaoNode:SKShapeNode{
    var model: LigacaoModel
    var starLocation: CGPoint
    var endLocation: CGPoint
    var angulo: CGFloat
    var raio: CGFloat
    
    init(starEstado:EstadoNode, endEstado:EstadoNode, tipoLigacao:LigacaoEnum) {
        self.model = LigacaoModel(starEstado: starEstado.model, endEstado: endEstado.model, enumLigacao: tipoLigacao)
        self.starLocation = starEstado.position
        self.endLocation = endEstado.position
        self.angulo = atan2(abs(starLocation.y - endLocation.y), abs(starLocation.x - endLocation.x))
        if (starLocation.y<endLocation.y && starLocation.x>endLocation.x) || (starLocation.y>endLocation.y && starLocation.x<endLocation.x){
            self.angulo *= -1
        }
        self.raio = starEstado.size.width
        super.init()
        // triangulo
        let pathToDraw = CGMutablePath()
        pathToDraw.move(to: starLocation)
        pathToDraw.addLine(to: endLocation)
        
        self.path = pathToDraw
        self.zPosition = -1
        self.lineWidth = 2
        
        
        switch tipoLigacao {
        case .touch:
            self.strokeColor = SKColor.white
            triangulo(color:.white)
        case .time:
            self.strokeColor = SKColor.blue
            triangulo(color:.blue)
        case .distance:
            self.strokeColor = SKColor.red
            triangulo(color:.red)
        }
    }
    
    func createLabel(text:String,imgName:String,imgSize:CGSize){
        let node = SKNode()
        let x = starLocation.x>endLocation.x ? starLocation.x - (starLocation.x - endLocation.x)/2 : endLocation.x - (endLocation.x - starLocation.x)/2
        let y = starLocation.y>endLocation.y ? starLocation.y - (starLocation.y - endLocation.y)/2 : endLocation.y - (endLocation.y - starLocation.y)/2
        node.zRotation = self.angulo
        node.position = CGPoint(x: x, y: y)
        let label = SKLabelNode(text: text)
        label.position = CGPoint(x: text.count*10, y: Int(imgSize.height)/2)
        let img = SKSpriteNode(texture: SKTexture(imageNamed: imgName), color: .clear, size: imgSize)
        img.position = CGPoint(x: -imgSize.width/2, y: imgSize.height)
        node.addChild(label)
        node.addChild(img)
        self.addChild(node)
    }
    
    func triangulo(color:SKColor){
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 12.5))
        path.addLine(to: CGPoint(x: 12.5, y: -9.15))
        path.addLine(to: CGPoint(x: -12.5, y: -9.15))
        path.addLine(to: CGPoint(x: 0.0, y: 12.5))
        
        let triangulo = SKShapeNode(path: path.cgPath)
        let ySub = sin(angulo)*(raio/2+12.5)
        let xSub = cos(angulo)*(raio/2+12.5)
        var x:CGFloat = 0
        var y:CGFloat = 0
        
        if starLocation.x<endLocation.x{
            triangulo.zRotation = angulo + .pi/6
            x = endLocation.x - xSub
            y = endLocation.y - ySub
        }
        else{
            triangulo.zRotation = angulo - .pi/6
            x = endLocation.x + xSub
            y = endLocation.y + ySub
        }
        triangulo.fillColor = color
        
        triangulo.position = CGPoint(x:x, y: y)
        self.addChild(triangulo)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
