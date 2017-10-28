//
//  ViewController.swift
//  test
//
//  Created by yi shing wong on 28/10/2017.
//  Copyright © 2017 Sashawilldo. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController {


    @IBOutlet weak var label: UILabel!
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        testingThing.thing = "abc"
        print(testingThing.thing)
        save()
    }
    @IBAction func loadButtonClicked(_ sender: UIButton) {
        testingThing.thing = load()
        
        label.text = testingThing.thing as String
    }
    
    var testingThing = TestingThing(input:"default")
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    private func save() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(testingThing, toFile: TestingThing.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save...", log: OSLog.default, type: .error)
        }
    }

    private func load() -> String  {
        if let text = NSKeyedUnarchiver.unarchiveObject(withFile: TestingThing.ArchiveURL.path) as? String {
            return text
        } else {
            return "nil"
        }
    }
    
}

