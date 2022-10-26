// CinemaDescriptionViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с подробным описанием фильма.
final class CinemaDescriptionViewController: UIViewController {
    // MARK: - Private visual components

    private var tableView = UITableView()
    private var showTrailerButton = UIButton()
    private var favoriteFlagImageView = UIImageView()
    private var showLaterLabel = UILabel()
    private var downloadImageView = UIImageView()
    private var downloadLabel = UILabel()
    private var descriprionLabel = UILabel()
    private var premieraDateLabel = UILabel()
    private var dateLabel = UILabel()
    private var showLeftCountLabel = UILabel()
    private var showCountRigthLabel = UILabel()
    private var cinemaRatingLeftLabel = UILabel()
    private var cinemaRatingRigthLabel = UILabel()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureScene()
    }

    // MARK: - Private methods

    private func configureScene() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(PosterTableViewCell.self, forCellReuseIdentifier: "PosterTableViewCell")

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

/// Методы UITableViewDataSource, UITableViewDelegate
extension CinemaDescriptionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let
            cell = tableView.dequeueReusableCell(
                withIdentifier: "PosterTableViewCell",
                for: indexPath
            ) as? PosterTableViewCell
        else { return UITableViewCell() }
        cell.configureCell()
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
