//
//  ViewController.swift
//  test
//
//  Created by Maestro on 29/01/18.
//  Copyright © 2018 Maestro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var btnsi: UIButton!
    @IBOutlet weak var btnno: UIButton!
    @IBOutlet weak var cont: UIButton!
    
    @IBOutlet weak var correcto: UILabel!
    @IBOutlet weak var checkmark: UIImageView!
    @IBOutlet weak var vw: UIView!
    @IBOutlet weak var score: UILabel!
    var preguntas : [String] = []
    
    var imagenes : [UIImage] = []
    var current = 0
    var correctas = 0
    
    var respuestas = [true, true, false, true, false, false, true, true, false, false]
    
    @IBAction func donext(_ sender: Any) {
        UIView.transition(with: vw, duration: 0.5, options: [.transitionCurlDown], animations: {
            
            if(self.current >= 9)
            {
                self.correcto.isHidden = false
                self.btnsi.isHidden = true
                self.btnno.isHidden = true
                self.cont.isHidden = true
                self.question.isHidden = true
                self.checkmark.isHidden = true
                
                self.correcto.text = "Gracias por participar"
                self.score.isHidden = false
                self.score.text = "Score: \(self.correctas) / 10"
            }
            else{

        self.current += 1
        self.correcto.isHidden = true
        self.checkmark.image = self.imagenes[self.current]
        self.question.text = self.preguntas[self.current]
        self.cont.isHidden = true
        self.question.isHidden = false
            self.btnsi.isHidden = false
            self.btnno.isHidden = false
            }
            
        }, completion: nil)
    }
    @IBAction func dosi(_ sender: Any) {
        UIView.transition(with: vw, duration: 0.5, options: [.transitionCurlUp], animations: {
            if(self.respuestas[self.current] == true)
            {
                self.correcto.isHidden = false
                self.correcto.text = "Correcto"
                self.checkmark.isHidden = false
                self.checkmark.image = UIImage(named: "checkmark")
                self.btnsi.isHidden = true
                self.btnno.isHidden = true
                self.cont.isHidden = false
                self.question.isHidden = true
                self.correctas += 1
                
            }
            else
            {
                self.correcto.isHidden = false
                self.correcto.text = "Incorrecto"
                self.checkmark.isHidden = false
                self.checkmark.image = UIImage(named: "wrong")
                self.btnsi.isHidden = true
                self.btnno.isHidden = true
                self.cont.isHidden = false
                self.question.isHidden = true
            }
        }, completion: nil)
    }
    @IBAction func dono(_ sender: Any) {
        UIView.transition(with: vw, duration: 0.5, options: [.transitionCurlUp], animations: {
            if(self.respuestas[self.current] == false)
            {
                self.correcto.isHidden = false
                self.correcto.text = "Correcto"
                self.checkmark.isHidden = false
                self.checkmark.image = UIImage(named: "checkmark")
                self.btnsi.isHidden = true
                self.btnno.isHidden = true
                self.cont.isHidden = false
                self.question.isHidden = true
                self.correctas += 1
                
            }
            else
            {
                self.correcto.isHidden = false
                self.correcto.text = "Incorrecto"
                self.checkmark.isHidden = false
                self.checkmark.image = UIImage(named: "wrong")
                self.btnsi.isHidden = true
                self.btnno.isHidden = true
                self.cont.isHidden = false
                self.question.isHidden = true
            }
        }, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imagenes.append(UIImage(named: "8ball")!)
        imagenes.append(UIImage(named: "blue")!)
        imagenes.append(UIImage(named: "fork")!)
        imagenes.append(UIImage(named: "knuckles")!)
        imagenes.append(UIImage(named: "logical-fallacy")!)
        
        imagenes.append(UIImage(named: "plant")!)
        imagenes.append(UIImage(named: "plant2")!)
        imagenes.append(UIImage(named: "redbox")!)
        imagenes.append(UIImage(named: "sad")!)
        imagenes.append(UIImage(named: "triangle")!)
        
        preguntas.append("Es una bola de 8?")
        preguntas.append("Este rectangulo es azul?")
        preguntas.append("Esto es un cuchillo?")
        preguntas.append("Sabe el camino?")
        preguntas.append("Esto tiene sentido?")
        
        preguntas.append("Es real esta planta?")
        preguntas.append("Y esta?")
        preguntas.append("La caja es roja?")
        preguntas.append("Esta feliz?")
        preguntas.append("Es naranja?")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        btnsi.layer.cornerRadius = 10.0
        btnno.layer.cornerRadius = 10.0
        cont.layer.cornerRadius = 10.0
        correcto.isHidden = true
        checkmark.image = imagenes[current]
        question.text = preguntas[current]
        cont.isHidden = true
        score.isHidden = true
        
    }
}

