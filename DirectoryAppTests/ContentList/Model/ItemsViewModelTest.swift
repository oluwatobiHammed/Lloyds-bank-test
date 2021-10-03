//
//  PeopleCellViewModelTest.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 03/08/2021.
//

import XCTest
@testable import DirectoryApp
class ItemsViewModelTest: XCTestCase {

    var content: Items!
    var sut: ItemsViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        content = Items(id: 32, title: "bjbs", subtitle: "kblbcd", date: "knljnjd")
        sut = ItemsViewModel(items: content)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        content = nil
        sut = nil
    }
    
    func testPeopleTableViewCellViewModel() {
        // what is it that we want to test?
        XCTAssertEqual("Title: \(String(describing: content.title!))", sut.title)
        XCTAssertEqual("Subtitle: \(String(describing: content.subtitle!))",  sut.subtitle)
        XCTAssertEqual("\(String(describing: content.date!))", sut.date)
        
    }
    
 


}
