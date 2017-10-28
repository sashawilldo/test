//
//  File.swift
//  test
//
//  Created by yi shing wong on 28/10/2017.
//  Copyright © 2017 Sashawilldo. All rights reserved.
//

import Foundation


class TestingThing:NSObject, NSCoding {
    
    var thing:String
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("testingThing")
    
    struct PropertyKey {
        static let firstKey = "thing"
    }
    
    init(input:String) {
        self.thing = input
        print("initializer called")
        print(self.thing)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        let input = aDecoder.decodeObject(forKey:PropertyKey.firstKey) as! String
        print("decoding initializer called")
        self.init(input:input)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(thing, forKey: PropertyKey.firstKey)
    }
}
