//
//  Word.swift
//  UI-185
//
//  Created by にゃんにゃん丸 on 2021/05/14.
//

import SwiftUI

struct Word: Identifiable {
    var id = UUID().uuidString
    var image : String
    var name : String
    var offset : CGFloat
    
}

var words = [

    Word(image: "p1", name: "Bridge", offset: 0),
    Word(image: "p2", name: "Mt Fuji", offset: 0),
    Word(image: "p3", name: "Sanfransisco", offset: 0),
    Word(image: "p4", name: "Air Cars", offset: 0),
    Word(image: "p5", name: "Red Mountain", offset: 0),
    Word(image: "p6", name: "Night Vison", offset: 0),
    Word(image: "p7", name: "Pissa", offset: 0),
    Word(image: "p8", name: "Taunel", offset: 0)
    
]

