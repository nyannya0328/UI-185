//
//  UrlViewModel.swift
//  UI-185
//
//  Created by にゃんにゃん丸 on 2021/05/14.
//

import SwiftUI

class UrlViewModel: ObservableObject {
    @Published var urls = [
        
        
        Page(url: URL(string: "https://www.apple.com/")!),
        Page(url: URL(string: "https://www.apple.com/")!),
        Page(url: URL(string: "https://www.apple.com/")!),
        Page(url: URL(string: "https://www.apple.com/")!),
        Page(url: URL(string: "https://www.apple.com/")!),
        Page(url: URL(string: "https://www.apple.com/")!),
        Page(url: URL(string: "https://www.apple.com/")!),
        Page(url: URL(string: "https://www.apple.com/")!),
        Page(url: URL(string: "https://www.apple.com/")!)
        
        
    ]
    
    @Published var slectedTab = "tab"
    
    @Published var currentapge : Page?
}

