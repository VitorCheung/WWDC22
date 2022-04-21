//
//  EstadoModel.swift
//  URFC
//
//  Created by Vitor Cheung on 11/04/22.
//

import Foundation
class EstadoModel{
    
    var estado : EstadosEnum
    var id: Int
    var ligacoesSair: [LigacaoModel?] = []
    var ligacoesEntrar: [LigacaoModel?] = []
    
    init(estado:EstadosEnum, id:Int ){
        self.estado = estado
        self.id = id
    }
    
    func deletarLigacao(id:Int){
        for i in 0..<ligacoesSair.count {
            if ligacoesSair[i]?.endEstado.id == id{
                ligacoesSair[i] = nil
            }
        }
        for i in 0..<ligacoesEntrar.count {
            if ligacoesEntrar[i]?.starEstado.id == id{
                ligacoesEntrar[i] = nil
            }
        }
    }
    
    func printar(){
        print("Estado:\(estado)")
        print("Id:\(id)")
        for ligacao in ligacoesSair {
            if let lig = ligacao{
                print("ligacao saindo:")
                lig.printar()
                print("")
            }
        }
        for ligacao in ligacoesEntrar {
            if let lig = ligacao{
                print("ligacao entrando:")
                lig.printar()
                print("")
            }
        }
        print("")
        
    }
}
