//
//  FetchableSampleViewController
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/10/07.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import UIKit

// MARK: - FetchableSampleViewInput

@MainActor
protocol FetchableSampleViewInput: AnyObject {
    // MARK: Methods called from presenter

    func updateSections(for state: FetchableSamplePresenterState)
}

// MARK: - FetchableSampleViewController

final class FetchableSampleViewController: ComposedCollectionViewController, SectionProvider, SectionDataSource {
    // MARK: VIPER property

    var presenter: (any FetchableSamplePresenterInput)!

    private(set) var sections = [any CollectionComposer.Section]()

    var sectionDataSource: CollectionComposer.SectionDataSource { self }

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
}

// MARK: FetchableSampleViewInput

extension FetchableSampleViewController: FetchableSampleViewInput {
    private func makeSections(for state: FetchableSamplePresenterState) -> [any CollectionComposer.Section] {
        // TODO: Construct sections
        return []
    }

    func updateSections(for state: FetchableSamplePresenterState) {
        // Do any additional setup before updating the view.
        store(makeSections(for: state))
    }
}
