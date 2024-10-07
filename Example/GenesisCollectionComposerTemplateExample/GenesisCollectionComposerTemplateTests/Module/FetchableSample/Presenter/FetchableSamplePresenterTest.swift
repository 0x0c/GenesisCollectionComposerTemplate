//
//  FetchableSamplePresenterTest
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/10/07.
//

@testable import GenesisCollectionComposerTemplateExample
import XCTest

class FetchableSamplePresenterTest: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: FetchableSampleInteractorInput {
        var sections = [any CollectionComposer.Section]()
    }

    class MockRouter: FetchableSampleRouterInput {

    }

    class MockViewController: FetchableSampleViewInput {
        func setupInitialState() {

        }

        func update(sections: [any CollectionComposer.Section]) {
            
        }
    }
}
