//
//  UrlView.swift
//  UI-185
//
//  Created by にゃんにゃん丸 on 2021/05/14.
//

import SwiftUI

struct UrlView: View {
    @StateObject var model = UrlViewModel()
    @Namespace var animation
    var body: some View {
        VStack{
            
            HStack{
                
                
                Image(systemName: "gamecontroller.fill")
                    .font(.system(size: 30, weight: .heavy))
                    .frame(width: 80, height: 50)
                    .foregroundColor(model.slectedTab == "tab" ? .black : .white)
                    .background(
                    
                        ZStack{
                            
                            if model.slectedTab != "tab"{
                                Color.clear
                            }
                            else{
                                
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                                   
                                
                            }
                        }
                    
                    )
                    .onTapGesture {
                        withAnimation{
                            model.slectedTab = "tab"
                        }
                    }
                
                Image(systemName: "ipod")
                    .font(.system(size: 30, weight: .heavy))
                    .frame(width: 80, height: 50)
                    .foregroundColor(model.slectedTab == "ipod" ? .black : .white)
                    .background(
                    
                        ZStack{
                            
                            if model.slectedTab != "ipod"{
                                Color.clear
                            }
                            else{
                                
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                                    
                                
                            }
                        }
                    
                    )
                    .onTapGesture {
                        withAnimation{
                            
                            model.slectedTab = "ipod"
                        }
                    }
                
                
                Image(systemName: "display")
                    .font(.system(size: 30, weight: .heavy))
                   .frame(width: 80, height: 50)
                    .foregroundColor(model.slectedTab == "display" ? .black : .white)
                    .background(
                    
                        ZStack{
                            
                            if model.slectedTab != "display"{
                                Color.clear
                            }
                            else{
                                
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                                    
                                
                            }
                        }
                    
                    )
                    .onTapGesture {
                        withAnimation{
                            
                            model.slectedTab = "display"
                        }
                    }
                
                
                
                
                
            }
            .background(
            
            
                ZStack{
                    
                    
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.purple,lineWidth: 5)
                }
            
            )
            .cornerRadius(10)
            .shadow(color: Color.white.opacity(0.3), radius: 10, x: 5, y: 5)
            .shadow(color: Color.white.opacity(0.3), radius: 5, x: -5, y: -5)
            .padding(.top)
            
            
            ScrollView{
                
                
                let columns = Array(repeating: GridItem(.flexible(),spacing: 15), count: 2)
                
                LazyVGrid(columns: columns, spacing: 15, content: {
                    
                    ForEach(model.urls){page in
                        
                        WebView(url: page.url)
                            .frame(height: 200)
                            .cornerRadius(10)
                            .onDrag({
                                
                                model.currentapge = page
                                
                                return NSItemProvider(contentsOf: URL(string: "\(page.url)")!)!
                                
                            })
                            .onDrop(of: [.url], delegate: DropViewDelegate(page: page, pagedata: model))
                        
                    }
                   
                })
                .padding()
                
                
            }
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea(.all, edges: .all))
        
    }
}

struct UrlView_Previews: PreviewProvider {
    static var previews: some View {
        UrlView()
    }
}
