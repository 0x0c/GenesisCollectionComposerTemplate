//
//  FetchableSampleInteractor
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/01/20.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Foundation

protocol FetchableSampleInteractorInput: ComposedViewFetchableInteractorInput where Entity == [ListItem] {
    // MARK: Methods called from presenter
}

protocol FetchableSampleInteractorOutput: AnyObject {
    // MARK: Callback methods for presenter
}

final class FetchableSampleInteractor {
    // MARK: VIPER property
    weak var presenter: (any FetchableSampleInteractorOutput)!
    var storage: [ListItem]?

    init() {}

    // MARK: Other private methods
}

extension FetchableSampleInteractor: FetchableSampleInteractorInput {
    func fetch(force: Bool) async throws {
        storage = [ListItem].mock()
        sleep(3)
    }
}
