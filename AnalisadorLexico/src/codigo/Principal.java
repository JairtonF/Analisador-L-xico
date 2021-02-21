/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;

import java.io.File;

/**
 *
 * @author AH
 */
public class Principal {
    public static void main(String[] args) {
        String caminho = "D:/ah/ifce/topicos java web/project7/AnalisadorLexico/src/codigo/Lexer.flex";
        generarLexer(caminho);
    }
      
    public static void generarLexer(String caminho){
        File arquivo = new File(caminho);
        JFlex.Main.generate(arquivo);
    }
}
