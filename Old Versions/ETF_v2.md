# PORTFOLIO MODELING

## Some examples ETFs:

**SPDR S\&P 500 (SPY):** The oldest surviving and most widely known ETF
tracks the S\&P 500 Index iShares Russell 2000 (IWM): Tracks the Russell
2000 small-cap index

**Invesco QQQ (QQQ):** Indexes the Nasdaq 100, which typically contains
technology stocks SPDR Dow Jones Industrial Average (DIA): Represents
the 30 stocks of the Dow Jones Industrial Average

**Sector ETFs:** Track individual industries such as oil (OIH), energy
(XLE), financial services (XLF), REITs (IYR), Biotech (BBH)

**Commodity ETFs:** Represent commodity markets including crude oil
(USO) and natural gas (UNG)

**Physically-Backed ETFs:** The SPDR Gold Shares (GLD) and iShares
Silver Trust (SLV) hold physical gold and silver bullion in the fund

## Creating Portfolios

The ETFs portfolios created were grouped using similar characteristics.
The first portfolio is comprised of tech related industries or indexes,
the second is comprised of physically-backed ETFs and commodities, and
the third is comprised of Sector ETFs.

## Comparing the Portfolios

Comparing the three portfolios of P1 Tech, P2 Commodities and Phisically
Backed (C\&PB) and P3 Sector ETFs shows similar distributions.
Inspecting the histograms, Tech appears to have a normal distribution,
C\&PB has a slight left tail and Sector ETFs has a slight right
tail.

<img src="ETF_v2_files/figure-gfm/unnamed-chunk-24-1.png" style="display: block; margin: auto;" />

## Performance

Tech has the highest average return of 613 dollars above the initial
100,000 dollars. Sector ETFs also had a positive average return of 468.3
dollars while C\&PB had an average negative return of 795.48 dollars.

The VaR for each portfolio was 93,873.05, 91,606.53 and 92,976.33
dollars for Tech, Sector ETFS and C\&PB respectively. Given the left
tail for C\&PB it is unsurprising that it has the lowest VaR, by far.
Tech has the best VaR - which would be the preferable portfolio for a
risk averse person.

Conversley, comparing the upper 95% simulated quantile shows Sector EFTs
has the highest upside with a return of 8,480.40 dollars, second is Tech
with 7,440.20 dollars. C\&PB has the lowest return at the 95% quintile
of 7,227.50 dollars.

## Conclusion

Given Tech has the highest VaR and average return, a risk averse person
should invest in this portfolio. For a risk seeker, they may try the
Sector ETFs portfolio which has the highest variance and highest
potential upside. The C\&PB portfolio is the riskiest and more volatile
out of the 3, there’s even a chance of losing more than 25% of it’s
value during the analyzed period.
