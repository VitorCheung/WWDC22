//
//  SwiftUIView.swift
//  
//
//  Created by Vitor Cheung on 18/04/22.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack{
            Color.gray
                .ignoresSafeArea()
            VStack{
                HStack{
                    Text("Need some help?")
                        .font(
                            .system(size: 35)
                            .weight(.bold)
                        )
                        .padding(.leading)
                    Spacer()
                    Button {
                        dismiss()
                    }label: {
                        Image("close")
                            .resizable()
                            .frame(width: buttonSize/2, height: buttonSize/2)
                            .padding()
                    }
                }
                TabView{
                        ParagraphView(title: "How to play?", textBody: "Welcome to URFC, The Ultimate Robot Fight Championship.\n\nIn this app, you need to create an automaton to battle roombas!\n\nYou win if the enemy roomba goes out of the ring!",imgName: "roombaFeliz1")
                        ParagraphView(title: "What is an automaton?", textBody: "An automaton is an abstract machine that can be used to solve computational problems, in this case you are going to create one and send it to battle roombas!\n\nAn automaton is a set of states that runs when it is given a sequence of inputs, those inputs are used to navigate between states. For this automaton each state is an action for the roomba to do and the inputs are conditions.In other words, the roomba changes action depending whether a condition is true.",imgName: "roombaFeliz0")
                        ParagraphImageView(title: "How to create your automaton", imgNames: ["create","line","erase","Run"], texts: ["The first step is to create the states, you'll notice that the first one will be colored green this is your initial state, meaning that the execution will start there. If you delete the initial state, the next state created will become the initial one.","In order to create the conditions just select the type and click on the origin after that click on the destination.","To remove a state just click on the icon, and select the state to be removed.","To start the battle just click on RUN."])
                        ParagraphImageView(title: "In this automaton there are 5 states:", imgNames: ["up","down","left","rigth","impulse"], texts: ["Up: the roomba moves upward.","Down: the roomba moves downward.","Left: the roomba moves leftward.","Right: the roomba moves rightward.","Impulse: the roomba launches itself in the direction it's facing."])
                        ParagraphImageView(title: "In this automaton there are 3 conditions", imgNames: ["time","distance","touch"], texts: ["Time: it sets a timer for the roomba's current action. ","Distance: it sets a distance for the roomba's current action","Touch: it the roomba will execute the current action until it touches another roomba."])
                }
                .tabViewStyle(.page)
            }
        }
    }
}
