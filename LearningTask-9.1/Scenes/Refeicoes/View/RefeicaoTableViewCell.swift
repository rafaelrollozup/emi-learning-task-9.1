//
//  RefeicaoTableViewCell.swift
//  LearningTask-9.1
//
//  Created by rafael.rollo on 20/07/2022.
//

import UIKit

class RefeicaoTableViewCell: UITableViewCell {

    @IBOutlet weak var simboloLabel: UILabel!
    @IBOutlet private weak var tituloLabel: UILabel!
    @IBOutlet private weak var horarioLabel: UILabel!
    
    var refeicao: Refeicao? {
        didSet {
            guard let refeicao = refeicao else { return }

            simboloLabel.text = refeicao.simbolo
            tituloLabel.text = refeicao.titulo
            horarioLabel.text = refeicao.horario
        }
    }
}
