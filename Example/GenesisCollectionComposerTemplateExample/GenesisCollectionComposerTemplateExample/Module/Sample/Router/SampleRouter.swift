//
//  SampleRouter
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/10/07.
//

import UIKit

@MainActor
protocol SampleRouterInput: AnyObject {
    // MARK: View transitions
}

@MainActor
final class SampleRouter {
    private unowned let viewController: SampleViewController

    init(viewController: SampleViewController) {
        self.viewController = viewController
    }

    static func assembleModule() -> SampleViewController {
        let view = SampleViewController()
        // TODO: Create a Storyboard with the same name as "Sample".
        // TODO: And Change "Sample" of "R.storyboard.Sample" to lowercase.
        // guard let view = R.storyboard.Sample.instantiateInitialViewController() else {
        //     fatalError("Fail to load SampleViewController from Storyboard.")
        // }
        let interactor = SampleInteractor()
        let router = SampleRouter(viewController: view)
        let presenter = SamplePresenter(view: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter

        return view
    }
}

extension SampleRouter: SampleRouterInput {}
