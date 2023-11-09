//
//  SSampleViewController
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2023/11/08.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import UIKit

@MainActor
protocol SSampleViewInput: ComposedViewInput {
    // MARK: Methods called from presenter
}

final class SSampleViewController: ComposedCollectionViewController, SectionProvider {
    // MARK: VIPER property
    var presenter: SSamplePresenterInput!

    lazy var sectionDataSource: CollectionComposer.SectionDataSource = presenter
    var sections: [any CollectionComposer.Section] {
        return presenter.sections
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        provider = self
        presenter.viewDidLoad()
    }

    override func didSelectItem(_ item: AnyHashable, in section: any CollectionComposer.Section) {
        presenter.didSelectItem(item, in: section)
    }

    // MARK: Other private methods
}

extension SSampleViewController: SSampleViewInput {
    func updateSections(_ sections: [any CollectionComposer.Section]) {
        // Do any additional setup before updating the view.
        updateDataSource(sections)
    }
}
