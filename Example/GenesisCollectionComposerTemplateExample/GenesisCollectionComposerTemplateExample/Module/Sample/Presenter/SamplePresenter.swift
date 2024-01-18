//
//  SamplePresenter
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/01/18.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Foundation

typealias SamplePresenterInputInterface = ComposedViewPresenterInput

@MainActor
protocol SamplePresenterInput: SamplePresenterInputInterface, SectionDataSource {
    // MARK: View Life-Cycle methods

    func viewDidLoad()

    // MARK: Other methods called from View
}

final class SamplePresenter {
    // MARK: VIPER properties
    weak var view: (any SampleViewInput)!
    var interactor: (any SampleInteractorInput)!
    var router: (any SampleRouterInput)!

    private(set) var sections = [any CollectionComposer.Section]()

    init(view: SampleViewInput, interactor: any SampleInteractorInput, router: SampleRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    @MainActor
    func store(_ sections: [any Section]) {
        self.sections = sections
        view?.updateSections(sections)
    }
}

extension SamplePresenter: SamplePresenterInput {
    func viewDidLoad() {
        // Do any additional setup after loading the view.
        updateSections()
    }

    func didSelectItem(_ item: AnyHashable, in section: any CollectionComposer.Section, at indexPath: IndexPath) {
        // Handle item selection
    }
}

extension SamplePresenter: SampleInteractorOutput {
    func updateSections() {
        // TODO: Store specific sections to update view
        store([
            ListSection {
                ListItem(id: UUID().uuidString, text: "Test1")
                ListItem(id: UUID().uuidString, text: "Test2")
                ListItem(id: UUID().uuidString, text: "Test3")
            }
        ])
    }
}
