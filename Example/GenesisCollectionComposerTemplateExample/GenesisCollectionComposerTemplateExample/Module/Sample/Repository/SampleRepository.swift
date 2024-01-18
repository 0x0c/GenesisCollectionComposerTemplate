//
//  SampleRepository
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/01/18.
//

import CollectionComposer
import CollectionComposerVIPERExtension

protocol SampleRepositoryInterface: ComposedViewRepositoryInterface where Entity == /* TODO: */ {}

final class SampleRepository: SampleRepositoryInterface {
    func fetch(force: Bool) async throws -> Entity {
        // TODO: Return entity
    }
}