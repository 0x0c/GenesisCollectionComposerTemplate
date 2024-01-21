//
//  SampleViewController
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/01/20.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import UIKit

@MainActor
protocol SampleViewInput: AnyObject {
    // MARK: Methods called from presenter

    func updateSections(for state: SamplePresenterState)
}

final class SampleViewController: ComposedCollectionViewController, SectionProvider, SectionDataSource {
    // MARK: VIPER property
    var presenter: (any SamplePresenterInput)!

    lazy var sectionDataSource: CollectionComposer.SectionDataSource = self

    override func viewDidLoad() {
        super.viewDidLoad()
        provider = self
        presenter.viewDidLoad()
    }

    override func didSelectItem(_ item: AnyHashable, in section: any CollectionComposer.Section, at indexPath: IndexPath) {
        // TODO: Handler selection
    }

    func store(_ sections: [any CollectionComposer.Section]) {
        self.sections = sections
        updateDataSource(self.sections)
    }

    // MARK: private

    private(set) var sections = [any CollectionComposer.Section]()
}

extension SampleViewController: SampleViewInput {
    private func makeSections(for state: SamplePresenterState) -> [any CollectionComposer.Section] {
        switch state {
        case .initial:
            return [ListSection(items: [ListItem].mock())]
        }
    }

    func updateSections(for state: SamplePresenterState) {
        // Do any additional setup before updating the view.
        store(makeSections(for: state))
    }
}
