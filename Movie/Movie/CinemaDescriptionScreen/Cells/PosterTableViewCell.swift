// PosterTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с паспортом.
final class PosterTableViewCell: UITableViewCell {
    // MARK: - Private visual components

    private var posterImageView = UIImageView()

    // MARK: - Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Public methods

    func configureCell() {
        configurePosterImageView()
    }

    // MARK: Private methods

    private func configurePosterImageView() {
        addSubview(posterImageView)
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.image = UIImage(named: "garrosh")
        posterImageView.contentMode = .scaleAspectFit

        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: topAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            posterImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
