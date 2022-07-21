//
//  RefeicoesViewController.swift
//  LearningTask-9.1

//  Created by rafael.rollo on 20/07/2022.
//

import UIKit

class RefeicoesViewController: UITableViewController {
    
    var refeicoesAPI: RefeicoesAPI?
    
    var refeicoes: [Refeicao] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        
        setupViews()
        carregaRefeicoes()
    }
    
    func setupViews() {
        tableView.tableHeaderView = RefeicoesTableHeaderView.build()
    }
    
    func carregaRefeicoes() {
        guard let refeicoesAPI = refeicoesAPI else { return }
        refeicoes = refeicoesAPI.carregaTodas()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "verDetalhesRefeicaoSegue" else { return }
        
        guard let celula = sender as? RefeicaoTableViewCell,
              let controllerDestino = segue.destination as? DetalhesRefeicaoViewController else {
            fatalError("Não foi possível executar a segue \(segue.identifier!)")
        }
        
        controllerDestino.refeicao = celula.refeicao
    }
    
}

// MARK: UITableViewDataSource implementations
extension RefeicoesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celula = tableView.dequeueReusableCell(withIdentifier: "RefeicaoTableViewCell", for: indexPath) as? RefeicaoTableViewCell else {
            fatalError("Não foi possível obter célula para a lista de refeições")
        }
        
        celula.refeicao = refeicoes[indexPath.row]
        return celula
    }

}
