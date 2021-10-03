//
//  RoomCellViewModelTests.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 03/08/2021.
//

import XCTest
@testable import DirectoryApp

class ContentsViewModelTests: XCTestCase {


    var item: Item!
    var sut: ContentsViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        item = Item(id: 32, title: "Article 4", subtitle: "Article 4 subtitle with placeholder text", body: "Article 4 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Article 4", date: "14/04/2013 11:48")
        sut = ContentsViewModel(content: item)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        item = nil
        sut = nil
    }
    
    func testContentsViewModelViewModel() {
        // what is it that we want to test?
        XCTAssertEqual("Title: \(String(describing: item.title!))", sut.title)
        XCTAssertEqual("Subtitle: \(String(describing: item.subtitle!))", sut.subtitle)
        XCTAssertEqual("Date: \(String(describing: item.date!))", sut.date)
      
    }

    
    
}
