// CinemaListViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Главный экран
final class CinemaListViewController: UIViewController {
    // MARK: - Private properties

    private var model: InfoAboutCinema?

    // MARK: - Private visual components

    private var cinemaListTableView = UITableView()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        getRequest()
    }

    // MARK: - private methods

    private func configureViews() {
        configureCinemaListTableView()
    }

    private func configureCinemaListTableView() {
        view.addSubview(cinemaListTableView)
        cinemaListTableView.separatorColor = .white
        cinemaListTableView.dataSource = self
        cinemaListTableView.delegate = self

        cinemaListTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cinemaListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            cinemaListTableView.topAnchor.constraint(equalTo: view.topAnchor),
            cinemaListTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            cinemaListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        cinemaListTableView.register(CinemaListTableViewCell.self, forCellReuseIdentifier: "CinemaListCell")
    }

    private func getRequest() {
        let urlString =
            "https://api.themoviedb.org/3/movie/upcoming?api_key=c7f7d1dc5a6aa58fd2f3602748ad9c64&language=ru&page-1"
        guard let url = URL(string: urlString) else { print("url nil"); return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, _, _ in
            do {
                let result = try JSONDecoder().decode(InfoAboutCinema.self, from: data ?? Data())
                self.model = result
                DispatchQueue.main.async {
                    self.cinemaListTableView.reloadData()
                }
            } catch {
                print("nil error")
            }
        }.resume()
    }
}

// Имплементация UITableViewDelegate, UITableViewDataSource
extension CinemaListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: "CinemaListCell", for: indexPath) as? CinemaListTableViewCell
        else { return UITableViewCell() }
        guard let model = model else { return UITableViewCell() }
        cell.configureCell(
            model: model.results[indexPath.row]
        )
        print("\(model.results.count)")
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
