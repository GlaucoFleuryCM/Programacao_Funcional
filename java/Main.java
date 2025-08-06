import java.io.FileReader;
import java.util.List;
import com.opencsv.*;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.Scanner;
import java.util.*;

public class Main {
    public static void main(String[] args) {
        //lista principal para o código
        List <Data> content = new ArrayList<Data>();

        //processando dados do CSV pra lista
        try {
            FileReader filereader = new FileReader("dados.csv");
            CSVReader csvReader = new CSVReader(filereader);

            String[] buffer;
            while ((buffer = csvReader.readNext()) != null) {
                content.add(Data(buffer[0], buffer[1], buffer[2], buffer[3], buffer[4]));
            }
        }
        catch (Exception erroFile) {
            erroFile.printStackTrace();
        }

        //Lendo parâmetros
        Scanner reader = new Scanner(System.in);
        int n1, n2, n3, n4;
        String[] input = reader.nextLine().split(" "); 
        input = Arrays.asList(input);
        List<Integer> numbers = input.stream()
            .map(Integer::parseInt)
            .collect(Collectors.toList());
    }
}