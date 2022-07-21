//
//  NovoIngredienteViewController.swift
//  LearningTask-9.1
//
//  Created by rafael.rollo on 21/07/2022.
//

import UIKit

class NovoIngredienteViewController: UIViewController {

    typealias MensagemDeValidacao = String
    
    @IBOutlet private weak var nomeLabel: UITextField!
    @IBOutlet private weak var simboloLabel: UITextField!
    @IBOutlet private weak var quantidadeLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func botaoAdicionarPressionado(_ sender: UIButton) {
        switch formularioEhValido() {
            
        case (false, let mensagem):
            exibeAlerta(titulo: "Erro", mensagem: mensagem)
            
        default:
            adicionaIngrediente()
        }
    }
    
    func formularioEhValido() -> (Bool, MensagemDeValidacao?) {
        if let nome = nomeLabel.text, nome.isEmpty {
            return (false, "Informe um nome para o ingrediente.")
        }
        
        if let simbolo = simboloLabel.text, simbolo.isEmpty {
            return (false, "Informe o emoji símbolo para o ingrediente.")
        }
        
        if let quantidade = quantidadeLabel.text, quantidade.isEmpty {
            return (false, "Informe a descrição da quantidade para o item.")
        }
        
        return (true, nil)
    }

    func adicionaIngrediente() {
        let ingrediente = Ingrediente(simbolo: simboloLabel.text!,
                                      nome: nomeLabel.text!,
                                      quantidade: quantidadeLabel.text!)
                
        // e agora josé ?
    }
    
}

extension NovoIngredienteViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        guard let currentText = textField.text,
              currentText.isEmpty || string.isEmpty else { return false }
        
        return true
    }
    
}
