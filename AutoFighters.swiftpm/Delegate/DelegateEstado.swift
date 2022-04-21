//
//  DelegateEstado.swift
//  URFC
//
//  Created by Vitor Cheung on 07/04/22.
//

import Foundation
import SpriteKit

protocol DelegateEstadosEditorAutomato: AnyObject{
    func getEstadoEditor() -> EditorEstadosAutomatoEnum
    func criarLigacao(touch: UITouch) -> LigacaoModel?
    func setStarEstadoNode(estadoNode: EstadoNode)
    func getStarEstadoNode() -> EstadoNode?
    func deleteEstado(estadoNode: EstadoNode)
}
