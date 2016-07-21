//
//  Problem.swift
//  MathQuiz For Third Standard
//
//  Created by Debaprio Banik on 7/12/16.
//  Copyright © 2016 Debaprio Banik. All rights reserved.
//

import Foundation

class Problem: NSObject {
    var question: String!
    var answer: String!
    var credit: NSInteger?
    var options: NSMutableArray?
    var selectedOption: String?
}
