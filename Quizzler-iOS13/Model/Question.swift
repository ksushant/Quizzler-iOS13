//
//  questions.swift
//  Quizzler-iOS13
//
//  Created by Sushant Patil on 20/11/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var answer: String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}
