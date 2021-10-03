//
//  PeopleViewModelTest.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 18/08/2021.
//

import XCTest
import RxSwift
@testable import DirectoryApp
class ContentListViewModelTest: XCTestCase {

    var itemsViewModel: ItemsViewModel!
    var item: Items!
    var mockContentList: MockContentListRepo!
    var sut: ContentListViewModel!
    var disposeBag: DisposeBag!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        item = Items(id: 33, title: "Article 5", subtitle: "Article 5 subtitle with placeholder text", date: "15/04/2013 11:48")
        itemsViewModel = ItemsViewModel(items: item)
        mockContentList = MockContentListRepo()
        disposeBag = DisposeBag()
        sut = ContentListViewModel(contentRepo: mockContentList)
    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        itemsViewModel = nil
        item = nil
        mockContentList = nil
        sut = nil
        disposeBag = nil
    }
    func testcontentListViewModel_WhenCalled_ShouldCallGetContentList() {
        // Arrange
        
        // Act
        sut.getContentList()

        // Assert
        XCTAssertTrue(mockContentList.isGetPeopleMethodCalled, "The getContentList() method was not called in the ContentListRepo class")

        

    }
    
    func testcontentListViewModel_WhenGetContentListOperationIsSuccesfull_ShouldCallGetContentList() {
        // Arrange
        
        // Act
        sut.getContentList()
        let expectation = self.expectation(description: "getContentList Web Service Response Expectation")
        // Assert
        sut.contentRepo.getContentList().subscribe { res in
            // Assert
            XCTAssertEqual(res.data?.items?.first?.title, "Article 8")
           
        } onError: { err in
            
        }.disposed(by: disposeBag)
        expectation.fulfill()
        self.wait(for: [expectation], timeout: 5)

    }

}
