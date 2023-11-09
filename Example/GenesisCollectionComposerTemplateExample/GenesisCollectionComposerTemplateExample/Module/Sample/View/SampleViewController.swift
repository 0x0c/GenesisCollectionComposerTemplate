//
//  SampleViewController
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2023/11/08.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import UIKit

@MainActor
protocol SampleViewInput: ComposedViewInput {
    // MARK: Methods called from presenter
}

final class SampleViewController: ComposedCollectionViewController, SectionProvider {
    // MARK: VIPER property
    var presenter: SamplePresenterInput!

    lazy var sectionDataSource: CollectionComposer.SectionDataSource = presenter
    var sections: [any CollectionComposer.Section] {
        return presenter.sections
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sample"
        provider = self
        presenter.viewDidLoad()
    }

    override func didSelectItem(_ item: AnyHashable, in section: any CollectionComposer.Section, at indexPath: IndexPath) {
        presenter.didSelectItem(item, in: section, at: indexPath)
    }

    // MARK: Other private methods
}

extension SampleViewController: SampleViewInput {
    func updateSections(_ sections: [any CollectionComposer.Section]) {
        // Do any additional setup before updating the view.
        updateDataSource(sections)
    }
}
