// CinemaListCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с описанием фильма.
final class CinemaListTableViewCell: UITableViewCell {
    // MARK: - Private visual components

    private var cinemaAvatarImageView = UIImageView()
    private var cinemaDescriptionLabel = UILabel()
    private var cinemaNameLabel = UILabel()
    private var ratingLabel = UILabel()
    private var countOfVote = UILabel()

    // MARK: Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    func configureCell(model: Result) {
        configureCinemaAvatarImageView(model: model)
        configureCinemaNameLabel(model: model)
        configureCinemaDescriptionLabel(model: model)
        configureRatingLabel(model: model)
        configureVoteLabel(model: model)

        print("nil model")

        DispatchQueue.main.async {
            let urlString =
                "https://api.themoviedb.org/3/configuration?api_key=c7f7d1dc5a6aa58fd2f3602748ad9c64"
            guard let url = URL(string: urlString) else { print("url nil"); return }
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, _, _ in
                do {
                    guard let result = try String(data: data ?? Data(), encoding: .isoLatin1)
                    else { return }
                } catch {
                    print("nil error")
                }
            }.resume()
        }

        DispatchQueue.main.async {
            let urlString = "https://image.tmdb.org/t/p/w500/\(model.posterPath)"
            guard let url = URL(string: urlString) else { return }
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, result, _ in
                do {
                    print("nil result \(urlString)")
                    guard let result = try UIImage(data: data ?? Data()) else { return }
                    DispatchQueue.main.async {
                        self.cinemaAvatarImageView.image = result
                    }
                } catch {
                    print("nil error")
                }
            }.resume()
        }
    }

    // MARK: - Private methods

    private func configureCinemaAvatarImageView(model: Result) {
        addSubview(cinemaAvatarImageView)
        cinemaAvatarImageView.translatesAutoresizingMaskIntoConstraints = false
        cinemaAvatarImageView.contentMode = .scaleAspectFill
        cinemaAvatarImageView.clipsToBounds = true
        cinemaAvatarImageView.layer.cornerRadius = 10

        NSLayoutConstraint.activate([
            cinemaAvatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: +10),
            cinemaAvatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: +10),
            cinemaAvatarImageView.heightAnchor.constraint(equalToConstant: 200),
            cinemaAvatarImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }

    private func configureCinemaNameLabel(model: Result) {
        addSubview(cinemaNameLabel)
        cinemaNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cinemaNameLabel.text = model.title
        cinemaNameLabel.textAlignment = .center
        cinemaNameLabel.font = UIFont.boldSystemFont(ofSize: 30)
        cinemaNameLabel.textColor = .systemYellow
        cinemaNameLabel.numberOfLines = 0

        NSLayoutConstraint.activate([
            cinemaNameLabel.leadingAnchor.constraint(
                equalTo: cinemaAvatarImageView.leadingAnchor
            ),
            cinemaNameLabel.topAnchor.constraint(equalTo: cinemaAvatarImageView.bottomAnchor, constant: +10),
            cinemaNameLabel.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -10
            )
        ])
    }

    private func configureCinemaDescriptionLabel(model: Result) {
        addSubview(cinemaDescriptionLabel)
        cinemaDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        cinemaDescriptionLabel.text = "\(model.overview)"
        cinemaDescriptionLabel.textAlignment = .justified
        cinemaDescriptionLabel.lineBreakMode = .byClipping
        cinemaDescriptionLabel.numberOfLines = 0

        NSLayoutConstraint.activate([
            cinemaDescriptionLabel.leadingAnchor.constraint(
                equalTo: cinemaAvatarImageView.leadingAnchor
            ),
            cinemaDescriptionLabel.topAnchor.constraint(equalTo: cinemaNameLabel.bottomAnchor, constant: +10),
            // cinemaDescriptionLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            cinemaDescriptionLabel.trailingAnchor.constraint(
                equalTo: cinemaAvatarImageView.trailingAnchor
            ),
        ])
    }

    private func configureRatingLabel(model: Result) {
        addSubview(ratingLabel)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.text = "Оценка: \(model.voteAverage)"
        ratingLabel.numberOfLines = 0

        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(
                equalTo: cinemaAvatarImageView.leadingAnchor
            ),
            ratingLabel.topAnchor.constraint(equalTo: cinemaDescriptionLabel.bottomAnchor, constant: +10),
            ratingLabel.trailingAnchor.constraint(
                equalTo: cinemaAvatarImageView.trailingAnchor
            )
        ])
    }

    private func configureVoteLabel(model: Result) {
        addSubview(countOfVote)
        countOfVote.translatesAutoresizingMaskIntoConstraints = false
        countOfVote.text = "Оценили: \(model.voteCount) пользователей"
        countOfVote.numberOfLines = 0

        NSLayoutConstraint.activate([
            countOfVote.leadingAnchor.constraint(
                equalTo: cinemaAvatarImageView.leadingAnchor
            ),
            countOfVote.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: +10),
            countOfVote.trailingAnchor.constraint(
                equalTo: cinemaAvatarImageView.trailingAnchor
            ),
            countOfVote.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
