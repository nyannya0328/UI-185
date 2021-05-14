//
//  DropViewDelegate.swift
//  UI-185
//
//  Created by にゃんにゃん丸 on 2021/05/14.
//

import SwiftUI

struct DropViewDelegate: DropDelegate {
    
    var page : Page
    var pagedata : UrlViewModel
    
    func performDrop(info: DropInfo) -> Bool {
        return true
    }
    
    func dropEntered(info: DropInfo) {
        
        let fromindex = pagedata.urls.firstIndex { (page) -> Bool in
            return page.id == pagedata.currentapge?.id
        } ?? 0
        
        let toindex = pagedata.urls.firstIndex { (page) -> Bool in
            return page.id == self.page.id
        } ?? 0
        
        if fromindex != toindex{
            
            withAnimation(.default){
                
                
                let frompage = pagedata.urls[fromindex]
                pagedata.urls[fromindex] = pagedata.urls[toindex]
                pagedata.urls[toindex] = frompage
                
            }
            
            
        }
        
        
         
        
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
}

