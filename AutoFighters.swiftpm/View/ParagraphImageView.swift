//
//  ParagraphImageView.swift
//  URFC
//
//  Created by Vitor Cheung on 19/04/22.
//

import SwiftUI

struct ParagraphImageView: View {
    var title:String
    var imgNames:[String]
    var texts:[String]
    
    var body: some View {
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
            ForEach((0..<imgNames.count), id:\.self){
                ImageRollView(img: imgNames[$0], text: texts[$0])
            }
            Spacer()
        }
    }
}

