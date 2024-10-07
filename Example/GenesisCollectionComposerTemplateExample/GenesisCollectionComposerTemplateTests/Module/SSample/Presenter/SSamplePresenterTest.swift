//
//  SSamplePresenterTest
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/01/18.
//

@testable import GenesisCollectionComposerTemplateExample
import XCTest

class SSamplePresenterTest: XCTestCase {
    class MockInteractor: SSampleInteractorInput {
        var sections = [any CollectionComposer.Section]()
    }

    class MockRouter: SSampleRouterInput {}

    class MockViewController: SSampleViewInput {
        func setupInitialState() {}

        func update(sections: [any CollectionComposer.Section]) {}
    }

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}
