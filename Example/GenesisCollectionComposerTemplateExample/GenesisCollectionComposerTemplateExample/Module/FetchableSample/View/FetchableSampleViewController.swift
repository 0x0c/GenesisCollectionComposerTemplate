//
//  FetchableSampleViewController
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2023/11/09.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import UIKit

@MainActor
protocol FetchableSampleViewInput: ComposedViewInput {
    // MARK: Methods called from presenter
}

final class FetchableSampleViewController: ComposedCollectionViewController, SectionProvider {
    // MARK: VIPER property
    var presenter: (any FetchableSamplePresenterInput)!

    lazy var sectionDataSource: CollectionComposer.SectionDataSource = presenter
    var sections: [any CollectionComposer.Section] {
        return presenter.sections
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        provider = self
        presenter.viewDidLoad()
    }

    override func didSelectItem(_ item: AnyHashable, in section: any CollectionComposer.Section, at indexPath: IndexPath) {
        presenter.didSelectItem(item, in: section, at: indexPath)
    }

    // MARK: Other private methods
}

extension FetchableSampleViewController: FetchableSampleViewInput {
    func updateSections(_ sections: [any CollectionComposer.Section]) {
        // Do any additional setup before updating the view.
        updateDataSource(sections)
    }
}
