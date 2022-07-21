//
//  NovaRefeicaoViewController.swift
//  LearningTask-9.1
//
//  Created by rafael.rollo on 20/07/2022.
//

import UIKit

class NovaRefeicaoViewController: UIViewController {
    
    typealias MensagemDeValidacao = String
    
    @IBOutlet var perfilButtons: [UIButton]!
    @IBOutlet weak var tituloLabel: UITextField!
    @IBOutlet weak var horarioLabel: UITextField!
    @IBOutlet weak var ingredientesTableView: UITableView!
    
    var perfilSelecionado: Int = 1 {
        didSet {
            atualizaViews()
        }
    }
    
    var ingredientes: [Ingrediente] = [] {
        didSet {
            ingredientesTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaViews()
    }

    private func atualizaViews() {
        perfilButtons.forEach { button in
            button.isEnabled = button.tag != perfilSelecionado
        }
    }
    
    @IBAction func selecionaPerfilDeRefeicao(_ sender: UIButton) {
        perfilSelecionado = sender.tag
    }
    
    @IBAction func botaoAdicionarPressionado(_ sender: Any) {
        switch formularioEhValido() {
            
        case (false, let mensagem):
            exibeAlerta(titulo: "Erro", mensagem: mensagem)
            
        default:
            adicionaRefeicao()
        }
    }
    
    func formularioEhValido() -> (Bool, MensagemDeValidacao?) {
        if let titulo = tituloLabel.text, titulo.isEmpty {
            return (false, "Informe um título para a refeição.")
        }
        
        if let horario = horarioLabel.text, horario.isEmpty {
            return (false, "Informe o horário programado para a refeição.")
        }
        
        if ingredientes.isEmpty {
            return (false, "Adicione ao menos um ingrediente para a refeição.")
        }
        
        return (true, nil)
    }

    func adicionaRefeicao() {
        let simbolo = perfilButtons.filter({ button in
            button.tag == perfilSelecionado
        }).first!.titleLabel!.text!
        
        // e agora josé ?
    }
    
}

extension NovaRefeicaoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celula = tableView.dequeueReusableCell(withIdentifier: "IngredienteTableViewCell", for: indexPath) as? IngredienteTableViewCell else {
            fatalError("Não foi possível recuperar uma célula para o ingrediente em NovaRefeicao")
        }
        
        celula.ingrediente = ingredientes[indexPath.row]
        return celula
    }
    
}
