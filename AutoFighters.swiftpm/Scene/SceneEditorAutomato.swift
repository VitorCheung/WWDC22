//
//  File.swift
//  AutoFighters
//
//  Created by Vitor Cheung on 06/04/22.
//

import Foundation
import SpriteKit
import SwiftUI

class SceneEditorAutomato: SKScene {
    
    @Binding var openTextField: Bool

    var starEstadoNode: EstadoNode?
    
    var automato = Automato.shared
        
    var ligacaoEstadosNodes: [LigacaoNode] = []
    
    var estadosNodes:[EstadoNode?] = []
    
    var i:Int = 0
    
    var enumEditorEstados = EditorEstadosAutomatoEnum.criarNovoEstado
    
    var enumEstados = EstadosEnum.impulse
    
    var enumLigacao = LigacaoEnum.touch
    
    override init() {
        self._openTextField = Binding.constant(true)
        super.init(size: CGSize(width: 100, height: 100))
    }
    
    func setOpenTextField(openTextField:Binding<Bool>) {
        self._openTextField = openTextField
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var sizeButton: CGSize{
        let height = self.frame.size.height
        let width = self.frame.size.width
        if width>height {
            return CGSize(width: height/13, height: height/13)
        }
        else{
            return CGSize(width: width/13, height: width/13)
        }
    }
    
    
    //MARK: buttons
    
    var buttonEstados:SKButtonNode{
        let bt = SKButtonNode(imageName: "create") {
            self.enumEditorEstados =  EditorEstadosAutomatoEnum.criarNovoEstado
            self.starEstadoNode = nil
            self.loadScene()
        }
        if enumEditorEstados == EditorEstadosAutomatoEnum.criarNovoEstado {
            bt.alpha = 1
        }
        bt.size = sizeButton
        bt.position = CGPoint(x: bt.size.width/2, y: self.frame.size.height/2 + bt.size.height+10)
        return bt
    }
    
    var buttonLigacao:SKButtonNode{
        let bt = SKButtonNode(imageName: "line") {
            self.enumEditorEstados =  EditorEstadosAutomatoEnum.criarLigação
            self.starEstadoNode = nil
            self.loadScene()
        }
        if enumEditorEstados == EditorEstadosAutomatoEnum.criarLigação {
            bt.alpha = 1
        }
        bt.size = sizeButton
        bt.position = CGPoint(x: bt.size.width/2, y: self.frame.size.height/2)
        return bt
    }
    
    var buttonApagar:SKButtonNode{
        let bt = SKButtonNode(imageName: "erase") {
            self.enumEditorEstados =  EditorEstadosAutomatoEnum.apagar
            self.starEstadoNode = nil
            self.loadScene()
        }
        if enumEditorEstados == EditorEstadosAutomatoEnum.apagar {
            bt.alpha = 1
        }
        bt.size = sizeButton
        bt.position = CGPoint(x: bt.size.width/2, y: self.frame.size.height/2 - bt.size.height-10)
        return bt
    }
    //MARK: buttons Estados
    
    var buttonEstadosUP:SKButtonNode{
        let bt = SKButtonNode(imageName: "buttonUp") {
            self.starEstadoNode = nil
            self.enumEstados = EstadosEnum.up
            self.loadScene()
        }
        if enumEstados == EstadosEnum.up {
            bt.alpha = 1
        }
        bt.size = sizeButton
        bt.position = CGPoint(x: 1.75*(bt.size.width), y: self.frame.size.height/2 + 2*(bt.size.height+10) )
        return bt
    }
    
    var buttonEstadosDown:SKButtonNode{
        let bt = SKButtonNode(imageName: "buttonDown") {
            self.starEstadoNode = nil
            self.enumEstados = EstadosEnum.down
            self.loadScene()
        }
        if enumEstados == EstadosEnum.down {
            bt.alpha = 1
        }
        bt.size = sizeButton
        bt.position = CGPoint(x: 1.75*(bt.size.width), y: self.frame.size.height/2+bt.size.height+10)
        return bt
    }
    
    var buttonEstadosLeft:SKButtonNode{
        let bt = SKButtonNode(imageName: "buttonLeft") {
            self.starEstadoNode = nil
            self.enumEstados = EstadosEnum.left
            self.loadScene()
        }
        if enumEstados == EstadosEnum.left {
            bt.alpha = 1
        }
        bt.size = sizeButton
        bt.position = CGPoint(x: 1.75*(bt.size.width), y: self.frame.size.height/2)
        return bt
    }
    
    var buttonEstadosRight:SKButtonNode{
        let bt = SKButtonNode(imageName: "buttonRight") {
            self.starEstadoNode = nil
            self.enumEstados = EstadosEnum.right
            self.loadScene()
        }
        if enumEstados == EstadosEnum.right {
            bt.alpha = 1
        }
        bt.size = sizeButton
        bt.position = CGPoint(x: 1.75*(bt.size.width), y: self.frame.size.height/2 - bt.size.height-10)
        return bt
    }
    
    var buttonEstadosImpulse:SKButtonNode{
        let bt = SKButtonNode(imageName: "buttonImpulse") {
            self.starEstadoNode = nil
            self.enumEstados = EstadosEnum.impulse
            self.loadScene()
        }
        if enumEstados == EstadosEnum.impulse {
            bt.alpha = 1
        }
        bt.size = sizeButton
        bt.position = CGPoint(x: 1.75*(bt.size.width), y: self.frame.size.height/2 - 2*(bt.size.height + 10))
        return bt
    }
    
    //MARK: buttons ligacoes
    
    var buttonLigacaoTouch:SKButtonNode{
        let bt = SKButtonNode(imageName: "buttonTouch") {
            self.starEstadoNode = nil
            self.enumLigacao = LigacaoEnum.touch
            self.loadScene()
        }
        if enumLigacao == LigacaoEnum.touch {
            bt.alpha = 1
        }
        bt.size = sizeButton
        bt.position = CGPoint(x: 1.75*(bt.size.width), y: self.frame.size.height/2 + bt.size.height + 10)
        return bt
    }
    
    var buttonLigacaoTempo:SKButtonNode{
        let bt = SKButtonNode(imageName: "buttonTime") {
            self.starEstadoNode = nil
            self.enumLigacao = LigacaoEnum.time
            self.loadScene()
        }
        if enumLigacao == LigacaoEnum.time {
            bt.alpha = 1
        }
        bt.size = sizeButton
        bt.position = CGPoint(x: 1.75*(bt.size.width), y: self.frame.size.height/2)
        return bt
    }
    
    var buttonLigacaoDistancia:SKButtonNode{
        let bt = SKButtonNode(imageName: "buttonDistance") {
            self.starEstadoNode = nil
            self.enumLigacao = LigacaoEnum.distance
            self.loadScene()
        }
        if enumLigacao == LigacaoEnum.distance {
            bt.alpha = 1
        }
        bt.size = sizeButton
        bt.position = CGPoint(x: 1.75*(bt.size.width), y: self.frame.size.height/2-bt.size.height-10)
        return bt
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        loadScene()
    }
    
    func createButtonsEstados(){
        addChild(buttonEstadosImpulse)
        addChild(buttonEstadosDown)
        addChild(buttonEstadosUP)
        addChild(buttonEstadosLeft)
        addChild(buttonEstadosRight)
    }
    
    func createButtonsLigacoes(){
        addChild(buttonLigacaoTouch)
        addChild(buttonLigacaoTempo)
        addChild(buttonLigacaoDistancia)
    }
    
    func loadScene(){
        removeAllChildren()
        
        addChild(buttonEstados)
        addChild(buttonLigacao)
        addChild(buttonApagar)
        for estado in estadosNodes {
            if let estado = estado {
                addChild(estado)
            }
        }
        for line in ligacaoEstadosNodes {
            addChild(line)
        }
        
        if enumEditorEstados == EditorEstadosAutomatoEnum.criarNovoEstado{
            createButtonsEstados()
        }
        else if enumEditorEstados == EditorEstadosAutomatoEnum.criarLigação{
            createButtonsLigacoes()
        }

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        if enumEditorEstados == EditorEstadosAutomatoEnum.criarNovoEstado {
            let estadoNode = EstadoNode(location: location, estado: enumEstados, side: sizeButton.width, id: i)
            estadoNode.delegate = self
            i += 1
            addChild(estadoNode)
            estadosNodes.append(estadoNode)
            automato.estados.append(estadoNode.model)
//            estadoNode.model.printar()
        }   
        
    }
}
extension SceneEditorAutomato: DelegateEstadosEditorAutomato{
    
    func criarLigacao(touch: UITouch) -> LigacaoModel? {
        let location = touch.location(in: self)
        let touchedNode = self.atPoint(location) as? EstadoNode
        var line:LigacaoNode? = nil
        if let starEstadoNode = starEstadoNode {
            if let touchedNode = touchedNode {
                if starEstadoNode == touchedNode{
                    return nil
                }
                if ligacaoEstadosNodes.count == 0{
                    line = LigacaoNode(starEstado: starEstadoNode, endEstado: touchedNode,tipoLigacao: enumLigacao)
                    if let line = line {
                        ligacaoEstadosNodes.append(line)
                        addChild(line)
                    }
                }
                else{
                    var isLigacaoFeita = false
                    for j in (0..<ligacaoEstadosNodes.count).reversed(){
                        if ( ligacaoEstadosNodes[j].model.endEstado.id == touchedNode.model.id && ligacaoEstadosNodes[j].model.starEstado.id == starEstadoNode.model.id ) || ( ligacaoEstadosNodes[j].model.endEstado.id == starEstadoNode.model.id && ligacaoEstadosNodes[j].model.starEstado.id == touchedNode.model.id ) {
                            isLigacaoFeita = true
                            break
                        }
                    }
                    if !(isLigacaoFeita) {
                        line = LigacaoNode(starEstado: starEstadoNode, endEstado: touchedNode,tipoLigacao: enumLigacao)
                        if let line = line {
                            ligacaoEstadosNodes.append(line)
                            addChild(line)
                        }
                        
                    }
                }
            }
        }
        if let line = line {
            starEstadoNode?.model.ligacoesSair.append(line.model)
//            starEstadoNode?.model.printar()
            if enumLigacao != LigacaoEnum.touch{
                openTextField = true
            }
            else{
                setQuantidade(quant:"touch")
            }
            self.starEstadoNode = nil
            return line.model
        }
        else{
            return nil
        }
    }
    
    func setStarEstadoNode(estadoNode: EstadoNode) {
        starEstadoNode = estadoNode
    }
    
    func getStarEstadoNode() -> EstadoNode? {
        return starEstadoNode
    }
    
    func deleteEstado(estadoNode: EstadoNode){
        for j in (0..<ligacaoEstadosNodes.count).reversed(){
            if ligacaoEstadosNodes[j].model.endEstado.id == estadoNode.model.id || ligacaoEstadosNodes[j].model.starEstado.id == estadoNode.model.id {
                let ligacao = ligacaoEstadosNodes[j]
                ligacao.removeFromParent()
                ligacaoEstadosNodes.remove(at: j)
            }
        }
        estadosNodes[estadoNode.model.id] = nil
        automato.deleteEstado(id: estadoNode.model.id)
    }
    
    func getEstadoEditor() -> EditorEstadosAutomatoEnum {
        return enumEditorEstados
    }
    
    func setQuantidade(quant:String) {
        if quant == "" {
            ligacaoEstadosNodes.removeLast()
            loadScene()
        }
        else{
            let lig = ligacaoEstadosNodes.last
            lig?.model.quantidade = Double(quant) ?? 0.0
            let size = CGSize(width: sizeButton.width/2, height: sizeButton.height/2)
            switch lig?.model.enumLigacao{
            case .touch:
                lig?.createLabel(text: "", imgName: "touch",imgSize: size)
            case .time:
                lig?.createLabel(text: ": "+quant, imgName: "time",imgSize: size)
            case .distance:
                lig?.createLabel(text: ": "+quant, imgName: "distance",imgSize: size)
            case .none:
                fatalError("enumLigacoes não achou um caso")
            }
        }
    }
}
