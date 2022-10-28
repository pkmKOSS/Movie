// RatingTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с оценками пользователей.
final class RatingTableViewCell: UITableViewCell {
    // MARK: - Private visual components

    private var premieraDateLeftLabel = UILabel()
    private var premieraDateRigthLabel = UILabel()
    private var showCountLeftLabel = UILabel()
    private var showCountRigthLabel = UILabel()
    private var cinemaRatingLeftLabel = UILabel()
    private var cinemaRatingRigthLabel = UILabel()

    // MARK: - Public methods

    func configureCell(
        countOfVote: Int,
        avarageVote: Double
    ) {
        addSubviews()
        configurePremieraDateLeftLabel()
        configurePremieraDateRigthLabel()
        configureShowCountLeftLabel()
        configureShowCountRigthLabel(countOfVote: countOfVote)
        configureСinemaRatingLeftLabel()
        configureСinemaRatingRigthLabel(avarageVote: avarageVote)
    }

    // MARK: - Private methods

    private func addSubviews() {
        addSubview(premieraDateLeftLabel)
        addSubview(premieraDateRigthLabel)
        addSubview(showCountLeftLabel)
        addSubview(showCountRigthLabel)
        addSubview(cinemaRatingLeftLabel)
        addSubview(cinemaRatingRigthLabel)

        backgroundColor = .systemYellow
        selectionStyle = .none
    }

    private func configurePremieraDateLeftLabel() {
        premieraDateLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        premieraDateLeftLabel.text = StringConstants.premieraDateLeftLabelText

        NSLayoutConstraint.activate([
            premieraDateLeftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            premieraDateLeftLabel.topAnchor.constraint(equalTo: topAnchor, constant: +15),
            premieraDateLeftLabel.widthAnchor.constraint(equalToConstant: 150),
            premieraDateLeftLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func configurePremieraDateRigthLabel() {
        premieraDateRigthLabel.translatesAutoresizingMaskIntoConstraints = false
        premieraDateRigthLabel.text = StringConstants.premieraDateRigthLabelText
        premieraDateRigthLabel.textAlignment = .right

        NSLayoutConstraint.activate([
            premieraDateRigthLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            premieraDateRigthLabel.topAnchor.constraint(equalTo: topAnchor, constant: +15),
            premieraDateRigthLabel.widthAnchor.constraint(equalToConstant: 150),
            premieraDateRigthLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func configureShowCountLeftLabel() {
        showCountLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        showCountLeftLabel.text = StringConstants.showCountLeftLabelText

        NSLayoutConstraint.activate([
            showCountLeftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            showCountLeftLabel.topAnchor.constraint(equalTo: premieraDateLeftLabel.bottomAnchor),
            showCountLeftLabel.widthAnchor.constraint(equalToConstant: 150),
            showCountLeftLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func configureShowCountRigthLabel(countOfVote: Int) {
        showCountRigthLabel.translatesAutoresizingMaskIntoConstraints = false
        showCountRigthLabel.text = "\(countOfVote)"
        showCountRigthLabel.textAlignment = .right

        NSLayoutConstraint.activate([
            showCountRigthLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            showCountRigthLabel.topAnchor.constraint(equalTo: premieraDateRigthLabel.bottomAnchor),
            showCountRigthLabel.widthAnchor.constraint(equalToConstant: 150),
            showCountRigthLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func configureСinemaRatingLeftLabel() {
        cinemaRatingLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        cinemaRatingLeftLabel.text = StringConstants.cinemaRatingLeftLabelText

        NSLayoutConstraint.activate([
            cinemaRatingLeftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            cinemaRatingLeftLabel.topAnchor.constraint(equalTo: showCountLeftLabel.bottomAnchor),
            cinemaRatingLeftLabel.widthAnchor.constraint(equalToConstant: 150),
            cinemaRatingLeftLabel.heightAnchor.constraint(equalToConstant: 30),
            cinemaRatingLeftLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func configureСinemaRatingRigthLabel(avarageVote: Double) {
        cinemaRatingRigthLabel.translatesAutoresizingMaskIntoConstraints = false
        cinemaRatingRigthLabel.text = "\(avarageVote)"
        cinemaRatingRigthLabel.textAlignment = .right

        NSLayoutConstraint.activate([
            cinemaRatingRigthLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            cinemaRatingRigthLabel.topAnchor.constraint(equalTo: showCountRigthLabel.bottomAnchor),
            cinemaRatingRigthLabel.widthAnchor.constraint(equalToConstant: 150),
            cinemaRatingRigthLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
