//
//  BatalhaView.swift
//  URFC
//
//  Created by Vitor Cheung on 14/04/22.
//

import SwiftUI
import SpriteKit

struct BatalhaView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var isStarNil = false
    var scene: SceneBatalha = SceneBatalha()
    
    var body: some View {
        ZStack{
            SpriteView(scene: scene)
                .ignoresSafeArea()
                .navigationBarHidden(true)
                .alert("You dont have a inicial state", isPresented: $isStarNil) {
                    Button("OK", action: {
                        dismiss()
                    })
                }.onAppear{
                    scene.setDismiss {
                        dismiss()
                    }
                    isStarNil = Automato.shared.isStart()
                }
            HStack{
                VStack{
                    Button {
                        dismiss()
                    }label: {
                        Image("Back")
                            .resizable()
                            .frame(width: buttonSize, height: buttonSize)
                            .padding()
                            .ignoresSafeArea()
                    }
                    Spacer()
                }
                Spacer()
            }

        }
    }
    
}


