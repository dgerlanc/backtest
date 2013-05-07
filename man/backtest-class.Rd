\name{backtest-class}
\docType{class}
\alias{backtest-class}

\alias{show,backtest-method}
\alias{summary,backtest-method}
\alias{summaryStats,backtest-method}
\alias{means,backtest-method}
\alias{counts,backtest-method}
\alias{totalCounts,backtest-method}
\alias{marginals,backtest-method}
\alias{naCounts,backtest-method}
\alias{turnover,backtest-method}
\alias{ci,backtest-method}
\alias{plot,backtest,missing-method}

\alias{means}
\alias{counts}
\alias{summaryStats}
\alias{totalCounts}
\alias{marginals}
\alias{naCounts}
\alias{turnover}
\alias{ci}
\alias{plot}

\title{Class "backtest"}
\description{Contains results from the backtest function.}

\section{Objects from the Class}{
  Objects can be created by calls to the function \code{backtest(data,
    in.var, ret.var, ...)}.
}

\section{Slots}{
  \describe{
    \item{\code{in.var}:}{Object of class \code{"character"} specifying
      the \code{in.var} values for this backtest.
    }
    \item{\code{ret.var}:}{Object of class \code{"character"} containing
      the \code{ret.var} values for this backtest.
    }
    \item{\code{by.var}:}{Object of class \code{"character"} containing
      the \code{by.var}, if specified, for this backtest. 
    }
    \item{\code{date.var}:}{Object of class \code{"character"} containing
      the \code{date.var}, if specified, for this backtest. 
    }
    \item{\code{buckets}:}{Object of class \code{"numeric"} containing
      the number(s) of buckets used create quantiles from the
      \code{in.var} and \code{by.var} values.
    }
    \item{\code{results}:}{A 5-dimensional \code{"array"} containing the
      results of the backtest.
    }
    \item{\code{ret.stats}:}{Object of class \code{"array"} containing
      return statistics for the backtest.  
    }
    \item{\code{turnover}:}{Object of class \code{"array"} containing
      turnover statistics for the backtest.
    }
    \item{\code{natural}:}{Object of class \code{"logical"} expressing
      whether or not the intervals between observations, as specified by
      \code{date.var}, and returns, as specified by \code{ret.var},
      match.  If the interval between dates is one month, the interval
      between returns should also be one month.
    }
    \item{\code{do.spread}:}{Object of class \code{"logical"}. If TRUE the \code{summary}
      method displays information about the spread between the extreme
      quantiles.  If FALSE this information is suppressed.  Defaults to TRUE.
    }
    \item{\code{by.period}:}{Object of class \code{"logical"}. If TRUE the quantiles are
      recalculated within each date period.  If FALSE the quantiles are
      calculated all at once.  Defaults to TRUE.
    }
    \item{\code{overlaps}:}{An object of class \code{"numeric"} which specifies
      the number of prior periods to include in the current period's
      portfolio weights calculation. If \code{overlaps} is the default of 1,
      backtest behaves as usual and only uses a periods own data to
      determine its portfolio.  If \code{overlaps} is set to
      n > 1, a period's portfolio comprises the weighted mean of
      portfolio weights from the previous n periods, with period n
      having a weight of 1/n.
    }
  }
}
\section{Methods}{
  \describe{
    \item{show}{\code{signature(object = "backtest")}: Prints the
      variables used in this backtest.
    }
    \item{summary}{\code{signature(object = "backtest")}: Prints
      the results of the backtest.
    }
    \item{summaryStats}{\code{signature(object = "backtest")}:
      Returns a data frame with spreads for each \code{date.var} value and each
      \code{in.var}.
    }
    \item{means}{\code{signature(object = "backtest")}: Returns a list
      of matrices, with one matrix for each \code{in.var}, where the
      value of each cell is the mean of the returns for that
      \code{in.var} and \code{by.var} combination.
    }
    \item{counts}{\code{signature(object = "backtest")}: Returns a list
      of matrices, with one matrix for each \code{in.var}, where the
      value of each cell is the number of observations for that
      \code{in.var} and \code{by.var} combination.
    }
    \item{totalCounts}{\code{signature(object = "backtest")}: Returns a
      data frame in the same format as the speads data frame returned by \code{summaryStats}: 
      contains the sum of counts for all buckets (or high and
      low buckets if argument \code{low.high.only} is set to TRUE) of non-NA
      \code{in.var} values that went into the spread calculations. 
    }
    \item{marginals}{\code{signature(object = "backtest")}: Returns a
      list of matrices, one matrix for each \code{in.var}, where the
      value of each cell is the number of observations for that
      \code{in.var} and \code{by.var} combination.  Different from
      \code{counts} because the marginal sums have been appended to the
      matrices.
    }
    \item{naCounts}{\code{signature(object = "backtest")}: Returns a
      list of matrices, with one matrix for each \code{in.var}, where
      the value of each cell is the number of NA observations for that
      \code{in.var} and \code{by.var}
      combination.
    }
    \item{ci}{\code{signature(object = "backtest")}: Returns a
      matrix of confidence intervals for spreads.
    }

    \item{turnover}{\code{signature(object = "backtest")}: Returns a
      \code{data.frame} of the turnovers if the \code{backtest} is \code{natural}.
    }
    \item{plot}{\code{signature(x = "backtest", y = "missing")}: Plots
      returns, cumulative returns, or turnover, when passed a
      \code{type} argument of \code{return}, \code{cumreturn}, or
      \code{turnover}, respectively.
    }
  }
}

\details{

The primary method for accessing the \code{backtest} results is through
the \code{summary} method.  \code{summary} provides different displays
depending on the type of \code{backtest} object.  These displays are
shown in the examples section.  Accessor methods such as \code{means},
\code{counts}, \code{marginals}, \code{naCounts}, \code{turnover}, and
\code{ci} may be used to extract other types of information from the object.

A \code{backtest} object with a \code{natural} value of TRUE may be
graphed by calling the \code{plot} method.  The default \code{plot}
method graphs return.  The other plots, turnover and
cumulative return, must be explicitly specified as \code{plot(object,
  type = "turnover")} or \code{plot(object, type = "cumreturn")}.

The \code{backtest} object does not store the data frame used to create
the \code{backtest.}  It only stores the results and the names of the
vectors used in calculating these results.

The results of a \code{backtest} are stored in a 5-dimensional array,
\code{results}.  The 1st dimension contains one value for every element
of \code{ret.var}.  The 2nd dimension contains one value for
every element of \code{in.var}.  The 3rd dimension contains one value
for every element in \code{1:buckets[1]}, a vector from 1 through the
number of \code{by.var} buckets.  The 4th dimension contains one value
for every element in \code{1:buckets[2]}, a vector from 1 through the
number of \code{in.var} buckets.  The 5th dimension contains 4
elements: \code{means}, \code{counts}, \code{trim.means}, and
\code{NAs}.  

}

\seealso{\code{\link{backtest}}}

\examples{

data(starmine)
bt <- backtest(starmine, in.var = "smi", ret.var = "ret.0.1.m", by.period = FALSE)

## Summary for a pooled backtest

summary(bt)

## A natural backtest

bt <- backtest(starmine, in.var = "smi", ret.var = "ret.0.1.m",
               date.var = "date", id.var = "id", natural = TRUE, by.period = FALSE)

## Summary for a natural backtest

summary(bt)

## Other access methods

means(bt)
counts(bt)
marginals(bt)
naCounts(bt)

## Plotting methods

plot(bt, type = "turnover")
plot(bt, type = "return")
plot(bt, type = "cumreturn")

}

\author{Kyle Campbell \email{kyle.w.campbell@williams.edu}}
\keyword{classes}
