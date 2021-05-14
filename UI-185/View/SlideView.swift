//
//  SlideView.swift
//  UI-185
//
//  Created by にゃんにゃん丸 on 2021/05/14.
//

import SwiftUI

struct SlideView: View {
   
    var body: some View {
        VStack{
            
            HStack{
                
                Button(action: {
                    
                
                    
                }, label: {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                        .font(.title2)
                        .padding(5)
                        .background(
                        
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray,lineWidth: 3)
                        
                        )
                })
                
                Spacer(minLength: 10)
                
              NavigationLink(
                destination: UrlView(),
                label: {
                    
                    
                    Image(systemName: "gear")
                        .font(.title2)
                        .padding(5)
                        .background(
                        
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue,lineWidth: 3)
                        
                        )
                   
                })
                    
                
                
            }
            .foregroundColor(.primary)
            .overlay(
            Text("Slide Tab View")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 0, x: 5, y: 5)
                .shadow(color: .red, radius: 10, x: -5, y: -5)
            )
            .padding(.horizontal)
            
            
            GeometryReader{proxy in
                
                ZStack{
                    
                    ForEach(words.reversed()){index in
                        
                        WorldView(word: index, rect: proxy.frame(in: .global))
                        
                        
                    }
                    
                }
                
            }
            .padding([.horizontal,.top])
            
            
            
            
        }
        .background(Color.purple.opacity(0.1).ignoresSafeArea())
    }
    
  
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WorldView : View {
    
    @State var word : Word
    var rect : CGRect
    
    var body: some View{
        
        ZStack(alignment:.bottom){
            
            
            
            Image(word.image)
                .resizable()
                .frame(width: rect.width, height: rect.height)
            
            
            ZStack(alignment:.top){
                
                
                (word.offset > 0 ? Color.red : Color.green)
                    .opacity(word.offset != 0 ? 0.6 : 0)
                
                
                HStack{
                    
                    
                    if word.offset < 0 {
                        
                        Spacer(minLength: 0)
                    }
                        
                        Text(word.offset == 0 ? "" : (word.offset > 0 ? "Like" : "Good"))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top,25)
                   
                    
                    if word.offset > 0 {
                        
                        Spacer(minLength: 0)
                    }
                    
                }
                
                
            }
            
            VStack{
               
                
                HStack{
                    
                   
                 
                    
                        
                        
                        Text(word.name)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
              
              
                    
                    
                    Spacer()
                    
                }
                .padding(.bottom,30)
                
                
                
                HStack(spacing:30){
                   Spacer()
                    
                    Button(action: {
                        
                        
                        withAnimation(.easeInOut(duration: 1)){
                            
                            
                            word.offset = -1000
                            
                        }
                        
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 30, weight: .heavy))
                            .foregroundColor(.white)
                            .padding(20)
                            .background(Color.red)
                            .clipShape(Capsule())
                    })
                    
                    Button(action: {
                        
                        
                        withAnimation(.easeInOut(duration: 1)){
                            
                            
                            word.offset = 1000
                            
                        }
                        
                        
                    }, label: {
                        Image(systemName: "checkmark")
                            .font(.system(size: 30, weight: .heavy))
                         
                            .foregroundColor(.white)
                            .padding(20)
                            .background(Color.blue)
                            .clipShape(Capsule())
                        
                    })
                    
                   
                    
                    Spacer()
                    
                    
                }
                .padding(.bottom,20)
                
               
                
               
                 
               
            }
            
            
        }
        .cornerRadius(20)
        .offset(x: word.offset)
        .rotationEffect(.init(degrees: word.offset == 0 ? 0 : (word.offset > 0 ? 15 : -15)))
        .gesture(DragGesture().onChanged({ value in
            withAnimation(.default){
                
                word.offset = value.translation.width
                
            }
        }).onEnded({ value in
            withAnimation(.easeInOut){
                
                if word.offset > 150 {
                    
                    word.offset = 1000
                }
                else if word.offset < 150 {
                    
                    
                    word.offset = -1000
                }
                
                else{
                    
                    word.offset = 0
                }
            }
        }))
        
    }
}
