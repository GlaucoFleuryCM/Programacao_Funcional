public class Data {
    private final String country;
    private final String confirmed;
    private final String deaths;
    private final String recovery;
    private final String active;

    public Data(String country, String confirmed, String deaths,
                String recovery, String active) {
        this.country = country;
        this.confirmed = confirmed;
        this.deaths = deaths;
        this.recovery = recovery;
        this.active = active;
    }

    public String getCountry() {
        return country;
    }

    public String getConfirmed() {
        return confirmed;
    }

    public String getDeaths() {
        return deaths;
    }

    public String getRecovery() {
        return recovery;
    }

    public String getActive() {
        return active;
    }
}