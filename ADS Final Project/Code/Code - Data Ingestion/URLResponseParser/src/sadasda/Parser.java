/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sadasda;

/**
 *
 * @author Prateek
 */
import java.io.*;
import java.net.*;
import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import java.io.IOException;
 

public class Parser {

    /**
     * @param args the command line arguments
     */
    
    public static void main(String[] args) throws MalformedURLException, IOException
   {
      
        String url = "https://data.cityofboston.gov/api/views/awu8-dc52/rows.json";
        JsonFactory factory = new JsonFactory();
        JsonParser parser = factory.createParser(new URL(url));
        
        BufferedWriter bw = new BufferedWriter(new FileWriter("/Users/Prateek/Documents/ADS/@FINAL/filetest2.txt", true));
        // continue parsing the token till the end of input is reached
        while (!parser.isClosed()) {
            
            JsonToken token = parser.nextToken();
            // if its the last token then we are done
            if (token == null)
                break;

            if (JsonToken.FIELD_NAME.equals(token) && "data".equals(parser.getCurrentName())) {

                 token = parser.nextToken();
                 String txt = "";
                 
                 while (txt != "}")   //Iterate till the End of Json
                 {
                    token = parser.nextToken();
                    String tmp = parser.getText();
                    txt = tmp;
                    bw.write(tmp);
                  //System.out.println(parser.getText());
                    bw.newLine();
                    bw.flush();
                 }
                
            }
 
        }
    
}
    
}
