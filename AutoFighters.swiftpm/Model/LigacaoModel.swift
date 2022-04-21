//
//  ligacao.swift
//  URFC
//
//  Created by Vitor Cheung on 11/04/22.
//

import Foundation
class LigacaoModel {
    var starEstado: EstadoModel
    var endEstado: EstadoModel
    var enumLigacao: LigacaoEnum
    var quantidade: Double = 0.0
    
    init(starEstado: EstadoModel, endEstado: EstadoModel, enumLigacao: LigacaoEnum) {
        self.starEstado = starEstado
        self.endEstado = endEstado
        self.enumLigacao = enumLigacao
    }
    
    func printar(){
        print("starEstado:\(starEstado.id)")
        print("endEstado:\(endEstado.id)")
        print("enumLigacao:\(enumLigacao)")
        print("quantidade:\(quantidade)")
    }
}
