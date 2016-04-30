/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication16;

/**
 *
 * @author Prateek
 */

import com.google.gson.*;
import java.net.MalformedURLException;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import com.microsoft.azure.eventhubs.*;
import com.microsoft.azure.servicebus.*;

public class JavaApplication16 {

    /**
     * @param args the command line arguments
     */ 
    
    public static void main(String[] args) throws MalformedURLException, IOException, ServiceBusException {
        
            final String namespaceName = "ServceBuS-Bos311";
            final String eventHubName = "EventHuB-Bos311";
            final String sasKeyName = "SendRule";
            final String sasKey = "8tZ7W8WzZmzrjoAYJjBu8+bHLCaaMBDW3J01IkJ9C38=";
            ConnectionStringBuilder connStr = new ConnectionStringBuilder(namespaceName, eventHubName, sasKeyName, sasKey);
            
            String strFileName = "/Users/Prateek/Documents/ADS/@FINAL/filetest2.txt";
            BufferedReader br = new BufferedReader(new FileReader(strFileName));
            StringBuilder sb = new StringBuilder();
            
            int cnt = 0;
         
        try {
                String line = br.readLine();
                
                while (line != null) {
                    sb.append(line);
                    line = br.readLine();
                    sb.append(",");
                }
            } finally {
                br.close();
            }
        
            String str = sb.toString();
            String [] a = str.split(",],],");
            List<String> list = new ArrayList<String>(Arrays.asList(a));
            list.remove(list.size() - 1);

            for(String as : list)
            {
                String [] cdd = as.split(",");
                int i = 0;
                CityData cd = new CityData();
                Gson gson = new Gson();
                
                for(String asd : cdd)
                {
                    
                         if(i >= 9  && i <= 40)
                         {
                            
                                if(i == 9)
                                {
                                    cd.setCASE_ENQUIRY_ID(asd);
                                }
                                else if(i == 10)
                                {
                                    cd.setOPEN_DT(asd);
                                }   
                                else if(i == 11)
                                {
                                    cd.setTARGET_DT(asd);
                                } 
                                 else if(i == 12)
                                {
                                    cd.setCLOSED_DT(asd);
                                } 
                                 else if(i == 13)
                                {
                                    cd.setOnTime_Status(asd);
                                } 
                                 else if(i == 14)
                                {
                                    cd.setCASE_STATUS(asd);
                                } 
                                 else if(i == 15)
                                {
                                    cd.setCLOSURE_REASON(asd);
                                } 
                                 else if(i == 16)
                                {
                                    cd.setCASE_TITLE(asd);
                                } 
                                 else if(i == 17)
                                {
                                    cd.setSUBJECT(asd);
                                    
                                }  else if(i == 18)
                                {
                                    cd.setREASON(asd);
                                    
                                }  else if(i == 19)
                                {
                                    cd.setTYPEE(asd);
                                    
                                }  else if(i == 20)
                                {
                                    cd.setQUEUEE(asd);
                                    
                                }  else if(i == 21)
                                {
                                    
                                    cd.setDepartment(asd);
                                    
                                }  else if(i == 22)
                                {
                                    cd.setSubmittedPhoto(asd);
                                    
                                }  else if(i == 23)
                                {
                                    cd.setClosedPhoto(asd);
                                    
                                }  else if(i == 24)
                                {
                                    cd.setLocation(asd);
                                } 
                                 else if(i == 25)
                                {
                                    cd.setFire_district(asd);
                                } 
                                 else if(i == 26)
                                {
                                    cd.setPwd_district(asd);
                                } 
                                 else if(i == 27)
                                {
                                    cd.setCity_council_district(asd);
                                } 
                                 else if(i == 28)
                                {
                                    cd.setPolice_district(asd);
                                } 
                                 else if(i == 29)
                                {
                                    cd.setNeighborhood(asd);
                                } 
                                 else if(i == 30)
                                {
                                    cd.setNeighborhood_services_district(asd);
                                }
                                else if(i == 31)
                                {
                                    cd.setWard(asd);
                                } 
                                else if(i == 32)
                                {
                                    cd.setPrecinct(asd);
                                } 
                                else if(i == 33)
                                {
                                    cd.setLand_usage(asd);
                                } 
                                else if(i == 34)
                                {
                                    cd.setLOCATION_STREET_NAME(asd);
                                } 
                                else if(i == 35)
                                {
                                    cd.setLOCATION_ZIPCODE(asd);
                                } 
                                else if(i == 36)
                                {
                                    cd.setProperty_Type(asd);
                                } 
                                else if(i == 37)
                                {
                                    cd.setProperty_ID(asd);
                                } 
                                else if(i == 38)
                                {
                                    cd.setLATITUDE(asd);
                                } 
                                else if(i == 39)
                                {
                                    cd.setLONGITUDE(asd);
                                } 
                                else if(i == 40)
                                {
                                    cd.setSource(asd);
                                }   
                   
                         }       
                     i ++; 
                }
                
             
                  cd.setGeocoded_Location("(" + cd.getLATITUDE() + "," + cd.getLONGITUDE() + ")");
                  String jsonInString = gson.toJson(cd);  //To convert CITYDATA Object into JSON
                  System.out.println(jsonInString);
                  cnt++;
                   
                  EventData sendEvent = new EventData(jsonInString.getBytes("UTF-8"));
                  EventHubClient ehClient = EventHubClient.createFromConnectionStringSync(connStr.toString());
                  ehClient.sendSync(sendEvent); // To send JSON object to Azure EventHub
                
                  i = 0;
            }
            
           // */
      
           System.out.println("ABC" + cnt);
           
    }
    
}
