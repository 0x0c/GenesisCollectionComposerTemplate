//
//  FetchableSampleRepository
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/01/18.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Foundation

protocol FetchableSampleRepositoryInterface: ComposedViewRepositoryInterface where Entity == [ListItem] {}

final class FetchableSampleRepository: FetchableSampleRepositoryInterface {
    func fetch(force: Bool) async throws -> Entity {
        return [
            ListItem(id: UUID().uuidString, text: "Test1"),
            ListItem(id: UUID().uuidString, text: "Test2"),
            ListItem(id: UUID().uuidString, text: "Test3")
        ]
    }
}
