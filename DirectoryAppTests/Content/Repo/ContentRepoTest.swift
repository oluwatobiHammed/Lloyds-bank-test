//
//  ContentRepoTest.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 24/09/2021.
//


import XCTest
import RxSwift
@testable import DirectoryApp
class ContentRepoTest: XCTestCase {
    var disposeBag: DisposeBag!
    var sut: ContentRepoImpl!
    var mockVMRoute: MockVMRoute!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockVMRoute = MockVMRoute()
        sut = ContentRepoImpl(vmRouteProtocol: mockVMRoute)
        disposeBag = DisposeBag()
       
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        mockVMRoute = nil
        disposeBag = nil
    }
    
    func testcontentListRepo_WhenCalled_ShouldCallGetContentList() {
        // Arrange
        
        // Act
        sut.getContent(id: 32)

        // Assert
        XCTAssertTrue(mockVMRoute.isGeMethodCalled, "The getContentList() method was not called in the ContentListRepo class")

        

    }

}
