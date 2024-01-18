//
//  FetchableSampleInteractor
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/01/18.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Foundation

protocol FetchableSampleInteractorInput: ComposedViewFetchableInteractorInput {
    // MARK: Methods called from presenter
}

protocol FetchableSampleInteractorOutput: ComposedViewInteractorOutput {
    // MARK: Callback methods for presenter
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
        await presenter.updateSections()
    }
}