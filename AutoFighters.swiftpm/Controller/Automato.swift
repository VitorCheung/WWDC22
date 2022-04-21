//
//  Automato.swift
//  URFC
//
//  Created by Vitor Cheung on 11/04/22.
//

import Foundation
class Automato{
    static let shared = Automato()
    var estados: [EstadoModel?] = []
    var start: Int? = nil
    
    func isStart() -> Bool{
        if start != nil{
            return false
        }
        return true
    }
    
    func isNewStart(estado:EstadoModel) -> Bool{
        if start == nil{
            start = estado.id
            return true
        }
        return false
    }
    
    func getLigacao(index:Int?, tipoLigacao:LigacaoEnum) -> LigacaoModel?{
        guard let index = index else { return nil}
        if let ligacoes = estados[index]?.ligacoesSair {
            for ligacao in ligacoes{
                if ligacao?.enumLigacao == tipoLigacao{
                    return ligacao
                }
            }
        }
        return nil
    }
    
    func printar(){
        print("\nAutomato:\n")
        for estado in estados{
            if let estado = estado {
                estado.printar()
                print("")
            }
        }
    }
    
    func deleteEstado(id:Int){
        guard let estado = estados[id] else { return }
        for i in 0..<estado.ligacoesEntrar.count{
            let starEstado = estado.ligacoesEntrar[i]?.starEstado
            starEstado?.deletarLigacao(id: id)
        }
        for i in 0..<estado.ligacoesSair.count{
            let endEstado = estado.ligacoesSair[i]?.endEstado
            endEstado?.deletarLigacao(id: id)
        }
        estados[id] = nil
        if id == start{
            start = nil
        }
    }
}
