//
//  GameView.swift
//  AutoFighters
//
//  Created by Vitor Cheung on 06/04/22.
//

import Foundation
import SwiftUI
import SpriteKit

struct EdicaoView: View {
    
    @ObservedObject var edicaoModel: EdicaoModel
    
    var scene: SceneEditorAutomato = SceneEditorAutomato()
    
    var body: some View {
        NavigationView{
            ZStack{
                SpriteView(scene: scene)
                    .ignoresSafeArea()
                    .textFieldAlert(isPresented: $edicaoModel.openTextField, title: "Type a number", text: "", placeholder: "", action: { newText in
                        if let newText = newText {
                            scene.setQuantidade(quant: newText)
                        } else {
                            scene.setQuantidade(quant: "")
                        }
                        
                    })
                    .onAppear{
                        scene.setOpenTextField(openTextField: $edicaoModel.openTextField)
                        scene.scaleMode = .resizeFill
                    }
                VStack{
                    HStack{
                        Button(action: {
                                edicaoModel.showInfoModalView = true
                              }, label: {
                                  ZStack{
                                      Image("info")
                                          .resizable()
                                          .frame(width: buttonSize/2, height: buttonSize/2)
                                          .padding()
                                  }
                              })
                            .sheet(isPresented: $edicaoModel.showInfoModalView) {
                              InfoView()
                            }
                        Spacer()
                        NavigationLink( destination: BatalhaView()){
                            ZStack{
                                Image("Run")
                                    .resizable()
                                    .frame(width: buttonSize, height: buttonSize)
                                    .padding()
                            }
                        }
                    }
                    Spacer()
                }
            }
            .ignoresSafeArea()
            .navigationBarTitle("")
            .navigationBarHidden(self.edicaoModel.isNavigationBarHidden)
            .onAppear {
                self.edicaoModel.isNavigationBarHidden = true
            }
        }
        .navigationViewStyle(.stack)
    }
}
extension View {

    func textFieldAlert(
            isPresented: Binding<Bool>,
            title: String,
            text: String = "",
            placeholder: String = "",
            action: @escaping (String?) -> Void
        ) -> some View {
            self.modifier(TextFieldAlertModifier(isPresented: isPresented, title: title, text: text, placeholder: placeholder, action: action))
        }
}

