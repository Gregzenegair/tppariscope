/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tp.junit;

import tp.dao.CRUD;

/**
 *
 * @author Gregzenegair
 */
public class CRUDTest {
    
    public static void main(String[] args) {
        CRUD crud = new CRUD("pariscope");
        String[] asResult = null;
        asResult = crud.selectId_categorie();
        StringBuilder sbResult = new StringBuilder();
        
        for(int i = 0; i< asResult.length; i++) {
            sbResult.append(asResult[i]);
            sbResult.append(" ");
        }
        System.out.println(sbResult);
    }
}
