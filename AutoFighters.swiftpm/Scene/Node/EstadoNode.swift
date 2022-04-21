//
//  EstadoNode.swift
//  AutoFighters
//
//  Created by Vitor Cheung on 06/04/22.
//

import Foundation
import SpriteKit

class EstadoNode:SKSpriteNode {
    
    var delegate: DelegateEstadosEditorAutomato?
    var model: EstadoModel
    
    init(location: CGPoint, estado: EstadosEnum, side: CGFloat, id: Int){
        self.model = EstadoModel(estado: estado, id: id)
        super.init(texture: nil, color: .clear, size: CGSize(width: side, height: side))

        self.position = location
        switch self.model.estado {
        case .left:
            if Automato.shared.isNewStart(estado: model){
                self.texture = SKTexture(imageNamed: "startLeft")
            }else{
                self.texture = SKTexture(imageNamed: "left")
            }
        case .right:
            if Automato.shared.isNewStart(estado: model){
                self.texture = SKTexture(imageNamed: "startRight")
            }else{
                self.texture = SKTexture(imageNamed: "rigth")
            }
        case .up:
            if Automato.shared.isNewStart(estado: model){
                self.texture = SKTexture(imageNamed: "startUp")
            }else{
                self.texture = SKTexture(imageNamed: "up")
            }
        case .down:
            if Automato.shared.isNewStart(estado: model){
                self.texture = SKTexture(imageNamed: "startDown")
            }else{
                self.texture = SKTexture(imageNamed: "down")
            }
        case .impulse:
            if Automato.shared.isNewStart(estado: model){
                self.texture = SKTexture(imageNamed: "startImpulse")
            }else{
                self.texture = SKTexture(imageNamed: "impulse")
            }
        }
        self.isUserInteractionEnabled = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let estadoEditor = delegate?.getEstadoEditor()
        guard let estadoEditor = estadoEditor else { return }
        if estadoEditor == EditorEstadosAutomatoEnum.apagar {
            self.removeFromParent()
            delegate?.deleteEstado(estadoNode: self)
        } else if estadoEditor == EditorEstadosAutomatoEnum.criarLigação{
            if delegate?.getStarEstadoNode() == nil{
                delegate?.setStarEstadoNode(estadoNode: self)
            }
            else{
                guard let touch = touches.first else { return }
                guard let ligacao = delegate?.criarLigacao(touch: touch) else { return }
                self.model.ligacoesEntrar.append(ligacao) 
            }
        }
    }
}

    


