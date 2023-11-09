//
//  FetchableSampleInteractor
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2023/11/09.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Foundation

typealias FetchableSampleInteractorInputInterface = ComposedViewFetchableInteractorInput

protocol FetchableSampleInteractorInput: FetchableSampleInteractorInputInterface {
    // MARK: Methods called from presenter
}

protocol FetchableSampleInteractorOutput: AnyObject {
    // MARK: Callback methods for presenter
    func storeSections(_ sections: [any CollectionComposer.Section])
}

final class FetchableSampleInteractor<Repository: FetchableSampleRepositoryInterface> {
    var repository: Repository

    // MARK: VIPER property
    weak var presenter: (any FetchableSampleInteractorOutput)!

    init(repository: Repository) {
        self.repository = repository
    }

    // MARK: Other private methods
}

extension FetchableSampleInteractor: FetchableSampleInteractorInput {
    func fetch(force: Bool) async throws {
        let result = try await repository.fetch(force: force)
        presenter.storeSections(makeSections(for: result))
    }

    func makeSections(for entity: Repository.Entity) -> [any CollectionComposer.Section] {
        // TODO: Convert entity to CollectionComposer.Section.
        return []
    }
}
