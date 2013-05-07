\name{starmine}
\alias{starmine}
\docType{data}
\title{StarMine Rankings, 1995}
\description{
  StarMine rankings of some stocks in 1995, with corresponding returns
  and other data.
}
\usage{data(starmine)}
\format{
  A data frame containing 53328 observations on the following 23 variables.
  \describe{
    \item{\code{date}}{Date on which the observation was recorded.  The
      dates have a monthly frequency.  Dates range from 1995-01-31 to 1995-11-30.}
    \item{\code{id}}{Unique identifier for each stock.}
    \item{\code{symbol}}{Company symbol.}
    \item{\code{name}}{Full company name.}
    \item{\code{country}}{Country of the exchange on which the company is listed. This factor has levels \code{AUS}, \code{CHE}, \code{DEU}, \code{DNK}, \code{ESP}, \code{FIN}, \code{FRA}, \code{GBR}, \code{HKG}, \code{ITA}, \code{JPN}, \code{NLD}, \code{NOR}, \code{NZL}, \code{SWE} and \code{USA}}
    \item{\code{sector}}{Sector specification. This factor has levels \code{Durbl}, \code{Enrgy}, \code{HiTec}, \code{Hlth}, \code{Manuf}, \code{Money}, \code{NoDur}, \code{Other}, \code{Shops}, \code{Telcm} and \code{Utils}}
    \item{\code{sec}}{An alternative sector specification. This factor has levels \code{CND}, \code{CNS}, \code{COM}, \code{ENE}, \code{FIN}, \code{HTH}, \code{IND}, \code{MAT}, \code{TEC} and \code{UTL}.}
    \item{\code{ind}}{Industry specification. This factor has levels \code{AERDF}, \code{AIRLN}, \code{AUTOP}, \code{AUTOS}, \code{BANKS}, \code{BEVGS}, \code{BIOTC}, \code{BUILD}, \code{CHEMS}, \code{CNENG}, \code{CNFIN}, \code{CNMAT}, \code{COMEQ}, \code{COMPT}, \code{COMSS}, \code{CONGL}, \code{CPMKT}, \code{DICNS}, \code{DISTR}, \code{DVFIN}, \code{DVTEL}, \code{ELEQI}, \code{ELEQT}, \code{ELUTL}, \code{ENEQS}, \code{FDPRD}, \code{FDRET}, \code{GSUTL}, \code{HEPSV}, \code{HEQSP}, \code{HETEC}, \code{HOTEL}, \code{HSDUR}, \code{HSPRD}, \code{INSUR}, \code{INTSS}, \code{IPPET}, \code{ITCAT}, \code{ITCON}, \code{LEISR}, \code{LFSCI}, \code{LOGIS}, \code{MACHN}, \code{MEDIA}, \code{METAL}, \code{MGFIN}, \code{MLRET}, \code{MLUTL}, \code{OFFIC}, \code{OILGS}, \code{PACKG}, \code{PAPER}, \code{PHARM}, \code{PRPRD}, \code{REALE}, \code{REDEV}, \code{REITS}, \code{RRAIL}, \code{SEMIP}, \code{SEMIS}, \code{SHIPS}, \code{SMOKE}, \code{SOFTW}, \code{SPRET}, \code{TEXAP}, \code{TRADE}, \code{TRINF}, \code{WIREL} and \code{WTUTL}}
    \item{\code{size}}{cap.usd normalized to N(0,1).}
    \item{\code{smi}}{StarMine Indicator (smi) score}
    \item{\code{liq}}{Liquidity of the company.}
  \item{\code{ret.0.1.m}}{One-month forward return of the company.}
    \item{\code{ret.0.6.m}}{Six-month forward return of the company.}
    \item{\code{ret.1.0.m}}{One-month prior return of the company.}
    \item{\code{ret.6.0.m}}{Six-month prior return of the company.}
    \item{\code{ret.12.0.m}}{Twelve-month prior return of the company.}
   \item{\code{mn.dollar.volume.20.d}}{Mean dollar volume of the past 20 days.}
    \item{\code{md.dollar.volume.120.d}}{Median dollar volume of the past 120 days.}
    \item{\code{cap.usd}}{Market capitalisation of the company in USD.}
    \item{\code{cap}}{Market capitalisation of the company in local currency.}
    \item{\code{sales}}{Annual gross sales of the company.}   
    \item{\code{net.income}}{Annual net income of the company.}       
    \item{\code{common.equity}}{Annual common equity of the company.} 
  }
}

\details{

\code{starmine} contains selected attributes such as sector, market
capitalisation, country, and various measures of return for a universe
of approximately 6,000 stocks.  The data is on a monthly frequency from
January 31, 1995 to November 30, 1995.

}

\note{We would like to thank StarMine Corporation for allowing us to
  include this data in the backtest package.
}

\source{
  StarMine Corporation.  For more information, see \url{http://www.starmine.com}.
}

\examples{
data(starmine)
head(starmine)
}
\keyword{datasets}
