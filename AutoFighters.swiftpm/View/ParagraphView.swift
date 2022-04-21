//
//  ParagraphView.swift
//  URFC
//
//  Created by Vitor Cheung on 18/04/22.
//

import SwiftUI

struct ParagraphView: View {
    var title:String
    var textBody:String
    var imgName:String
    var body: some View {
        ScrollView{
        VStack{
            HStack{
                Text(title)
                    .font(
                        .system(size: buttonSize/4)
                        .weight(.bold)
                    )
                    .padding()
                Spacer()
            }
                Text(textBody)
                .font(
                    .system(size: buttonSize/5)
                )
                .padding(.leading)
                .padding(.trailing)
            Spacer()
            Image(imgName)
                .resizable()
                .frame(width: buttonSize*1.2, height: buttonSize*1.2)
                .padding()
            Spacer()
        }
        }
    }
}

