# LogDensity.jl

The simple purpose of this package is to provide the function `logdensity` to other packages, just
like StatsBase.jl provides `loglikelihood`, and several packages have `logpdf`.  The intent is for
`logdensity` to allow more general semantics than the former, such as densities of measures, or
density evaluation for trace-based probabilistic programming systems.

The primary function is

```julia
logdensity(μ, x)
```

where `μ` is “measure-like”, i.e., associated with volume calculation via integration:

```
μ(A) = ∫_A exp(logdensity(μ, x)) dx
```

This covers [MeasureTheory.jl](https://github.com/cscherrer/MeasureTheory.jl) `AbstractMeasures`,
[Distributions.jl](https://github.com/JuliaStats/Distributions.jl) distributions (which are
proability measures), and various implementations of measures through probabilistic programs, for
which `logdensity` might be defined over a model and a trace data type or a similar specification of
an instantionation of some random variables.


## Exported functions

- `logdensity(μ, x)`
- `density(args..) = exp(logdensity(args...))`

The latter is defaulted, since in probabilistic context, the log-space implementation is usually
preferred, and the “normal-space” variant derived from it.  You can of course overload the latter,
too, if that is more efficient.
