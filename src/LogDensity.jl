module LogDensity

export density,
    logdensity

"""
    logdensity(μ, x)

Calculate the density of the measure-like `μ` at `x` in log-space.

`logdensity` should be well-defined over the extension of `μ`'s support to the whole range of the
type of compatible `x` values, returning an equivalent of `-Inf` outside the support (for meaningful
values, ignoring \"undefined\" cases like `NaN`)".
"""
function logdensity end


"""
    density(μ, x)

Calculate the density of the measure-like `μ` at `x`, in normal (i.e., non-log) space.  Should
fulfill the property

```julia
density(μ, x) = exp(logdensity(μ, x))
```

"""
density(args..) = exp(logdensity(args...))

end # module
