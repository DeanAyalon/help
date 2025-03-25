import java.util.Scanner;

public class ex5 {
    static String[][] currencyData = { // Could perhaps be better utilized as a Map
        {"USA", "USD"},
        {"Europe", "EUR"},
        {"UK", "GBP"},
        {"Israel", "ILS"}
    };

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String userInput;
        String result;
        boolean found;

        do {
            System.out.print("Please Enter Currency name (USD, EUR, GBP, ILS): ");
            userInput = input.nextLine().toUpperCase(); 
            result = getCountryByCurrency(userInput);

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

    public static String getCountryByCurrency(String currency) {
        for (int i = 0; i < currencyData.length; i++) {
            if (currency.equals(currencyData[i][1])) {
                return currencyData[i][0];
            }
        }
        return null; 
    }
}