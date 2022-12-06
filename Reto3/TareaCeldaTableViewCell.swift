//
//  TareaCeldaTableViewCell.swift
//  Reto3
//
//  Created by Duwal Abel Varillas Castro on 6/12/22.
//

import UIKit

class TareaCeldaTableViewCell: UITableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    
    var tarea: Tarea?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        montarDatos()
    }
    
    func montarDatos(){
        tituloLabel.text = tarea?.titulo
    }

}


