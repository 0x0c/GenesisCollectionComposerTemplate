//
//  ActivityIndicatorSection.swift
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/01/19.
//

import CollectionComposer
import Foundation
import UIKit

class ActivityIndicatorSection: Section {
    // MARK: Lifecycle

    init(id: String = UUID().uuidString, indicator: IndicatorContent = .init()) {
        self.id = id
        items = [indicator]
    }

    convenience init(id: String = UUID().uuidString, title: String? = nil, style: UIActivityIndicatorView.Style = .medium) {
        self.init(id: id, indicator: IndicatorContent(title: title, appearance: IndicatorAppearance(style: style)))
    }

    // MARK: Internal

    struct IndicatorContent: Hashable {
        // MARK: Lifecycle

        init(title: String? = nil, appearance: IndicatorAppearance = .init()) {
            self.title = title
            self.appearance = appearance
        }

        // MARK: Internal

        let title: String?
        let appearance: IndicatorAppearance
    }

    struct IndicatorAppearance: Hashable {
        // MARK: Lifecycle

        init(style: UIActivityIndicatorView.Style = .medium, tintColor: UIColor? = nil) {
            self.style = style
            self.tintColor = tintColor
        }

        // MARK: Internal

        let style: UIActivityIndicatorView.Style
        let tintColor: UIColor?
    }

    class ActivityIndicatorCell: UICollectionViewCell {
        // MARK: Lifecycle

        override init(frame: CGRect) {
            super.init(frame: frame)
            indicatorView.translatesAutoresizingMaskIntoConstraints = false
            label.translatesAutoresizingMaskIntoConstraints = false
            label.adjustsFontForContentSizeCategory = true
            label.font = UIFont.preferredFont(forTextStyle: .caption1)
            label.textColor = .secondaryLabel
            let stackView = UIStackView(arrangedSubviews: [
                indicatorView,
                label
            ])
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.distribution = .equalSpacing
            stackView.alignment = .center
            stackView.spacing = 8
            contentView.addSubview(stackView)
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
                stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
            indicatorView.startAnimating()
        }

        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("not implemnted")
        }

        // MARK: Internal

        let indicatorView = UIActivityIndicatorView()
        let label: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            return label
        }()
    }

    typealias Cell = ActivityIndicatorCell
    typealias Item = IndicatorContent

    var footer: (any CollectionComposer.BoundarySupplementaryFooterView)?

    var header: (any CollectionComposer.BoundarySupplementaryHeaderView)?
    var decorations: [CollectionComposer.Decoration] = []

    var id: String

    var cellRegistration: UICollectionView.CellRegistration<
        ActivityIndicatorCell,
        IndicatorContent
    >! = UICollectionView.CellRegistration<ActivityIndicatorCell, IndicatorContent> { cell, _, model in
        cell.indicatorView.style = model.appearance.style
        cell.label.text = model.title
    }

    var items: [IndicatorContent]
    var isExpanded = false
    var isExpandable = false

    var snapshotItems: [AnyHashable] {
        return items.map { AnyHashable($0) }
    }

    func storeHeader(_ header: (any CollectionComposer.BoundarySupplementaryHeaderView)?) {
        self.header = header
    }

    func storeFooter(_ footer: (any CollectionComposer.BoundarySupplementaryFooterView)?) {
        self.footer = footer
    }

    func decorations(_ decorations: [CollectionComposer.Decoration]) -> Self {
        self.decorations = decorations
        return self
    }

    func layoutSection(for environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(20)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize, supplementaryItems: [])
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(20)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        return NSCollectionLayoutSection(group: group)
    }

    func isHighlightable(for index: Int) -> Bool {
        return false
    }
}
