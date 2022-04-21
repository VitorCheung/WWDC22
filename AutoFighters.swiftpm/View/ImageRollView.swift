//
//  ImageRollView.swift
//  URFC
//
//  Created by Vitor Cheung on 19/04/22.
//
import SwiftUI

struct ImageRollView: View {
    var img:String
    var text:String
    var body: some View {
        HStack{
            Image(img)
                .resizable()
                .frame(width: buttonSize/2, height: buttonSize/2)
                .padding()
            Text(text)
                .font(
                    .system(size: buttonSize/5)
                )
                .padding(.leading)
                .padding(.trailing)
            Spacer()
        }
    }
}
