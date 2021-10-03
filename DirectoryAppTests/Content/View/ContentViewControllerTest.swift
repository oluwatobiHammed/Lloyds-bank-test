//
//  ContentViewControllerTest.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 24/09/2021.
//

import XCTest
@testable import DirectoryApp
class ContentViewControllerTest: XCTestCase {

    var cell:ContentListTableViewCell!
    var content: Item!
    var storyboard: UIStoryboard!
    var contentListViewModel: MockContentListViewModel!
    var sut: ContentViewController!
    var item: ContentsViewModel!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: ViewControllerID.ContentViewController.rawValue) as ContentViewController
        content = Item(id: 32, title: "Article 4", subtitle: "Article 4 subtitle with placeholder text",body: "", date: "14/04/2013 11:48")
        item = ContentsViewModel(content: content)
        contentListViewModel = MockContentListViewModel()
        _ = sut.view
        sut.loadViewIfNeeded()
        sut.getContent()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
         sut = nil
         cell = nil
         content = nil
    }
    
    func testContentViewController_WhenCreated_HasRequiredLabelEmpty() throws {
        
        let titleLabel = try XCTUnwrap(sut.titleLable, "The titleLabel is not connected to an IBOutlet")
        let subtitleLabel = try XCTUnwrap(sut.subtitleLabel, "The subtitleLabel is not connected to an IBOutlet")
        let bodyLable = try XCTUnwrap(sut.bodyLable, "The bodyLable is not connected to an IBOutlet")
        let dateLabel = try XCTUnwrap(sut.dateLabel, "The dateLabel is not connected to an IBOutlet")
    
        
        XCTAssertEqual(titleLabel.text, "", "First name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(subtitleLabel.text, "", "Last name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(bodyLable.text, "", "Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(dateLabel.text, "","Password text field was not empty when the view controller initially loaded")
       
       
    }
 
    

    
    
    func testViewModel() throws {
        contentListViewModel.getContentList()
      XCTAssertTrue(contentListViewModel.isGetPeopleMethodCalled)
       
    }

}
