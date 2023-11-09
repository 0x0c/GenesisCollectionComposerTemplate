//
//  SSampleInteractor
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2023/11/08.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Foundation

typealias SSampleInteractorInputInterface = ComposedViewInteractorInput

protocol SSampleInteractorInput: SSampleInteractorInputInterface {
    // MARK: Methods called from presenter
}

protocol SSampleInteractorOutput: AnyObject {
    // MARK: Callback methods for presenter
}

final class SSampleInteractor {

    // MARK: VIPER property
    weak var presenter: SSampleInteractorOutput!

    init() {}

    // MARK: Other private methods
}

extension SSampleInteractor: SSampleInteractorInput {
    func makeSections() -> [any Section] {
        return []
    }
}

