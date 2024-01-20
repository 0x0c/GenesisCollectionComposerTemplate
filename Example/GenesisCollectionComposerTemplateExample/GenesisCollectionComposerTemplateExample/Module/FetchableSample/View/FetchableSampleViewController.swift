//
//  FetchableSampleViewController
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/01/19.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import UIKit

@MainActor
protocol FetchableSampleViewInput: AnyObject {
    // MARK: Methods called from presenter

    func updateSections(for state: FetchableSamplePresenterState)
}

final class FetchableSampleViewController: ComposedCollectionViewController, SectionProvider, SectionDataSource {
    // MARK: VIPER property
    var presenter: (any FetchableSamplePresenterInput)!

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

extension FetchableSampleViewController: FetchableSampleViewInput {
    private func makeSections(for state: FetchableSamplePresenterState) -> [any CollectionComposer.Section] {
        switch state {
        case .loading:
            return [ActivityIndicatorSection()]
        case let .fetched(items):
            return [ListSection(items: items)]
        }
    }

    func updateSections(for state: FetchableSamplePresenterState) {
        // Do any additional setup before updating the view.
        store(makeSections(for: state))
    }
}
