import java.util.Scanner;

public class ex5 {

    public static void main(String[] args) {
        runCurrencyProgram(); 
    }

    
    public static void runCurrencyProgram() {
        String[][] currencyData = getCurrencyData(); 
        Scanner input = new Scanner(System.in);
        String userInput;
        String result;
        boolean found;

        do {
            System.out.print("Please Enter Currency name (USD, EUR, GBP, ILS): ");
            userInput = input.nextLine().toUpperCase(); 
            result = getCountryByCurrency(currencyData, userInput);

            if (result != null) {
                System.out.println("The matching country is: " + result);
                found = true;
            } else {
                System.out.println("Currency not found. Please try again.\n");
                found = false;
            }
        } while (!found);

        input.close();
    }

    
    public static String[][] getCurrencyData() {
        return new String[][] {
            {"USA", "USD"},
            {"Europe", "EUR"},
            {"UK", "GBP"},
            {"Israel", "ILS"}
        };
    }

    public static String getCountryByCurrency(String[][] data, String currency) {
        for (int i = 0; i < data.length; i++) {
            if (currency.equals(data[i][1])) {
                return data[i][0];
            }
        }
        return null; 
    }
}