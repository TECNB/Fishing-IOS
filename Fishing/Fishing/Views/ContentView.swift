//
//  ContentView.swift
//  Fishing
//
//  Created by TEC on 2023/8/8.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible:Bool=false
    @State private var siderValue:Double=50.0
    @State private var game:Game=Game()
    
    var body: some View {
        VStack {
            Text("🎣🎣🎣\n钓鱼")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            
            
            Text(String(game.target)+"米")
                .fontWeight(.bold)
                .kerning(-1.0)
                .font(.largeTitle)
            HStack {
                Text("1米")
                    .bold()
                Slider(value: self.$siderValue,in: 1.0...100.0)
                Text("100米")
                    .bold()
            }
            Button(action: {
                self.alertIsVisible=true
            }) {
                Text("点我")
            }
            .alert(isPresented: $alertIsVisible , content: {
                let roundedValue:Int=Int(self.siderValue.rounded())
                return Alert(title: Text("你好"),message: Text("滑块的值是\(roundedValue)。\n"+"你本轮获得了\(self.game.points(sliderValue: roundedValue))"),dismissButton: .default(Text("好好好 ")))
            })
        }
        .padding()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

