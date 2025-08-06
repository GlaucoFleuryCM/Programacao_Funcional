/*
    Glauco Fleury Corrêa de Moraes  15456302
    Renan Banci Catarin             14658181
*/

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.stream.Collectors;
import java.util.*;


public class Main {
    public static void main(String[] args) {

        // Lendo parâmetros de filtro
        Scanner reader = new Scanner(System.in);
        
        int[] params = Arrays.stream(reader.nextLine().split(" "))
        .mapToInt(Integer::parseInt)
        .toArray();
        
        reader.close();

        //lista principal para o código
        List<Data> content = new ArrayList<>();
        
        try {
            content = Files.lines(Paths.get("dados.csv"))
                .map(line -> line.split(","))
                .map(b -> new Data(b[0], Integer.parseInt((b[1])), Integer.parseInt((b[2])), Integer.parseInt((b[3])), Integer.parseInt((b[4]))))
                .collect(Collectors.toList());
                
        } catch (IOException e) {
            System.out.println("Erro ao ler o arquivo: " + e.getMessage());
        }

        int fstFilter = content.stream()
            .filter(d -> d.getConfirmed() >= params[0])
            .mapToInt(Data::getActive)
            .sum();

        int secFilter = content.stream()
            .sorted(Comparator.comparingInt(Data::getActive).reversed())
            .limit(params[1])                                                  
            .sorted(Comparator.comparingInt(Data::getConfirmed))        
            .limit(params[2])                                                  
            .mapToInt(Data::getDeaths)                                  
            .sum();                                                     

        List<String> trdFilter = content.stream()
            .sorted(Comparator.comparingInt(Data::getConfirmed).reversed())
            .limit(params[3])                                                      
            .sorted(Comparator.comparing(Data::getCountry))                 
            .map(Data::getCountry)                                          
            .collect(Collectors.toList());                                  

        System.out.println(fstFilter);
        System.out.println(secFilter);  
        trdFilter.forEach(System.out::println);
    }

    static class Data {
        private final String country;
        private final int confirmed;
        private final int deaths;
        private final int recovery;
        private final int active;

        public Data(String country, int confirmed, int deaths, int recovery, int active) {
            this.country = country;
            this.confirmed = confirmed;
            this.deaths = deaths;
            this.recovery = recovery;
            this.active = active;
        }

        public String getCountry() { return country; }
        public int getConfirmed() { return confirmed; }
        public int getDeaths() { return deaths; }
        public int getRecovered() { return recovery; }
        public int getActive() { return active; }
    }
}