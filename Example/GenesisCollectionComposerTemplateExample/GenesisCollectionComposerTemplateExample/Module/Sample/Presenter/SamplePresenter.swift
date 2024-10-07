//
//  SamplePresenter
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/10/07.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Combine
import Foundation

enum SamplePresenterState {
    // TODO: Add any states for view
    case initial
}

@MainActor
protocol SamplePresenterInput {
    // MARK: View Life-Cycle methods

    func viewDidLoad()

    // MARK: Other methods called from View
}

@MainActor
final class SamplePresenter {
    // MARK: VIPER properties
    weak var view: (any SampleViewInput)!
    var interactor: (any SampleInteractorInput)!
    var router: (any SampleRouterInput)!

    @Published private var state: SamplePresenterState = .initial
    private var cancellable = Set<AnyCancellable>()

    init(view: SampleViewInput, interactor: any SampleInteractorInput, router: SampleRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SamplePresenter: SamplePresenterInput {
    func viewDidLoad() {
        // Do any additional setup after loading the view.
        view.updateSections(for: state)
        $state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newState in
                guard let self else {
                    return
                }
                view.updateSections(for: newState)
            }.store(in: &cancellable)
        // TODO: Fetch data from interactor
    }
}

extension SamplePresenter: SampleInteractorOutput {}