//
//  FetchableSampleRepository
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2023/11/09.
//

import CollectionComposer
import CollectionComposerVIPERExtension

protocol FetchableSampleRepositoryInterface: ComposedViewRepositoryInterface where Entity == [ListItem] {}

final class FetchableSampleRepository: FetchableSampleRepositoryInterface {
    func fetch(force: Bool) async throws -> Entity {
        // TODO: Return entity
        return []
    }
}
