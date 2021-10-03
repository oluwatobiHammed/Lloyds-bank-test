//
//  ContentListResponseTest.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 24/09/2021.
//

import XCTest
@testable import DirectoryApp
class ContentListResponseTest: XCTestCase {

    var content: Items!
    var sut:ContentListResponse!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        content = Items(id: 32, title: "bjbs", subtitle: "kblbcd", date: "knljnjd")
        sut = ContentListResponse(items: [content])
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        content = nil
        sut = nil
    }
    
    func testContentListResponse() {
        // what is it that we want to test?
        sut.items?.forEach({ sut in
            XCTAssertEqual((String(describing: content.title!)), sut.title)
            XCTAssertEqual((String(describing: content.subtitle!)),  sut.subtitle)
            XCTAssertEqual((String(describing: content.date!)), sut.date)
        })
    }

}
