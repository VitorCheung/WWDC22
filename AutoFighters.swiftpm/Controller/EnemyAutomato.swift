//
//  enemyAutomato.swift
//  URFC
//
//  Created by Vitor Cheung on 20/04/22.
//

import Foundation

class EnemyAutomato{
    let automato = Automato()
    init(){
        automato.start = 0
        let estados = [
            EstadoModel(estado: .impulse, id: 0),
            EstadoModel(estado: .right, id: 1),
            EstadoModel(estado: .left, id: 2),
            EstadoModel(estado: .impulse, id: 3),
            EstadoModel(estado: .down, id: 4),
            EstadoModel(estado: .up, id: 5),
            EstadoModel(estado: .impulse, id: 6),
            EstadoModel(estado: .left, id: 7),
            EstadoModel(estado: .right, id: 8),
            EstadoModel(estado: .impulse, id: 9),
            EstadoModel(estado: .up, id: 10),
            EstadoModel(estado: .down, id: 11),
            
        ]
        estados[0].ligacoesSair.append(LigacaoModel(starEstado: estados[0], endEstado: estados[1], enumLigacao: .touch))
        estados[0].ligacoesSair.append(LigacaoModel(starEstado: estados[0], endEstado: estados[1], enumLigacao: .distance))
        estados[0].ligacoesSair[1]?.quantidade = 150
        
        estados[1].ligacoesSair.append(LigacaoModel(starEstado: estados[1], endEstado: estados[2], enumLigacao: .time))
        estados[1].ligacoesSair[0]?.quantidade = 0.75
        
        estados[2].ligacoesSair.append(LigacaoModel(starEstado: estados[2], endEstado: estados[3], enumLigacao: .distance))
        estados[2].ligacoesSair[0]?.quantidade = 10
        
        estados[3].ligacoesSair.append(LigacaoModel(starEstado: estados[3], endEstado: estados[4], enumLigacao: .touch))
        estados[3].ligacoesSair.append(LigacaoModel(starEstado: estados[3], endEstado: estados[4], enumLigacao: .distance))
        estados[3].ligacoesSair[1]?.quantidade = 150
        
        estados[4].ligacoesSair.append(LigacaoModel(starEstado: estados[4], endEstado: estados[5], enumLigacao: .time))
        estados[4].ligacoesSair[0]?.quantidade = 0.75
        
        estados[5].ligacoesSair.append(LigacaoModel(starEstado: estados[5], endEstado: estados[6], enumLigacao: .distance))
        estados[5].ligacoesSair[0]?.quantidade = 10
        
        estados[6].ligacoesSair.append(LigacaoModel(starEstado: estados[6], endEstado: estados[7], enumLigacao: .touch))
        estados[6].ligacoesSair.append(LigacaoModel(starEstado: estados[6], endEstado: estados[7], enumLigacao: .distance))
        estados[6].ligacoesSair[1]?.quantidade = 150
        
        estados[7].ligacoesSair.append(LigacaoModel(starEstado: estados[7], endEstado: estados[8], enumLigacao: .time))
        estados[7].ligacoesSair[0]?.quantidade = 0.75
        
        estados[8].ligacoesSair.append(LigacaoModel(starEstado: estados[8], endEstado: estados[9], enumLigacao: .distance))
        estados[8].ligacoesSair[0]?.quantidade = 10
        
        estados[9].ligacoesSair.append(LigacaoModel(starEstado: estados[9], endEstado: estados[10], enumLigacao: .touch))
        estados[9].ligacoesSair.append(LigacaoModel(starEstado: estados[9], endEstado: estados[10], enumLigacao: .distance))
        estados[9].ligacoesSair[1]?.quantidade = 150

        estados[10].ligacoesSair.append(LigacaoModel(starEstado: estados[10], endEstado: estados[11], enumLigacao: .time))
        estados[10].ligacoesSair[0]?.quantidade = 0.75

        estados[11].ligacoesSair.append(LigacaoModel(starEstado: estados[11], endEstado: estados[0], enumLigacao: .distance))
        estados[11].ligacoesSair[0]?.quantidade = 10
        
        automato.estados = estados

    }
}
