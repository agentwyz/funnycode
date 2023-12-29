public class Loan {
    private static String TERM_LOAN = "TL";
    private static String REVOLVER = "RC";
    private static String RCTL = "RCTL";

    //表示使用特定的类型
    private String type;

    private CapitalStrategy strategy;
    private float notional;
    private float outstanding;
    private int customerRating;
    private Date maturity;
    private Date expiry;

    public Loan(float notional, float outstanding, int customerRating, Date expiry) {
        this(TERM_LOAN, new TermROC(), notional, outstanding, customerRating, expiry, null);
    }

    public Loan(float notional, float outstanding, int customerRating, Date expiry, Date maturity) {
        this(RCTL, new RevolvingTermROC(), notional, outstanding, customerRating, expiry, maturity);
    }

    public Loan(CapitalStrategy strategy, float notional, float outstanding, int customerRating, Date) {
        //this(RCTL, );
    }

    public Loan(String type, CapitalStrategy strategy, float notional, float outstanding, int customerRating, Date expiry) {
        this.type = type;
    }
}