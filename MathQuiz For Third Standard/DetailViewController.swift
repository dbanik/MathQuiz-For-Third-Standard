//
//  DetailViewController.swift
//  MathQuiz For Third Standard
//
//  Created by Debaprio Banik on 7/12/16.
//  Copyright © 2016 Debaprio Banik. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var questionList: NSMutableArray!
    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var detailItem: String? {
        didSet {
            self.questionList = self.fetchQuestionList(detailItem!)
            for prob in self.questionList {
                print((prob as! Problem).question!)
            }
            self.refreshView()
        }
    }
    
    func fetchQuestionList(chapter: String) -> NSMutableArray {
        let qList: NSMutableArray = []
        var dbList: NSArray?
        if let path = NSBundle.mainBundle().pathForResource(chapter, ofType: "plist") {
            dbList = NSArray(contentsOfFile: path)
        }
        
        if let list = dbList as? Array<Dictionary<String,AnyObject>> {
            var prob :Problem
            for item: Dictionary<String,AnyObject> in list {
                prob = Problem.init()
                prob.question = item["question"] as? String
                prob.answer = item["answer"] as? String
                prob.options = item["options"] as? NSMutableArray
                prob.credit = item["credit"] as? NSInteger
                qList.addObject(prob)
            }
        }
        
        return qList
    }

    func refreshView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.refreshView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

